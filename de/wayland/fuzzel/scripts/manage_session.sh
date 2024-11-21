#!/usr/bin/dash
# A fuzzel shell script to manage the session.

case $(
		echo "Lock\0icon\0037system-lock-screen-symbolic\n\
Logout\0icon\0037system-log-out-symbolic\n\
Shutdown\0icon\0037system-shutdown-symbolic\n\
Suspend\0icon\0037system-suspend-symbolic\n\
Hibernate\0icon\0037system-hibernate-symbolic\n\
Hybrid Sleep\0icon\0037system-hibernate-symbolic\n\
Suspend Then Hibernate\0icon\0037system-hibernate-symbolic\n\
Reboot\0icon\0037system-reboot-symbolic\n\
Soft Reboot\0icon\0037system-reboot-symbolic\n"\
		| fuzzel --dmenu --index
	) in
	*0)
		err=$(loginctl lock-session 2>&1)
		;;
	*1)
		err=$(uwsm stop 2>&1)
		;;
	*2)
		err=$(systemctl poweroff 2>&1)
		;;
	*3)
		err=$(systemctl suspend 2>&1)
		;;
	*4)
		err=$(systemctl hibernate 2>&1)
		;;
	*5)
		err=$(systemctl hybrid-sleep 2>&1)
		;;
	*6)
		err=$(systemctl suspend-then-hibernate 2>&1)
		;;
	*7)
		err=$(systemctl reboot 2>&1)
		;;
	*8)
		err=$(systemctl soft-reboot 2>&1)
		;;
esac

# Show the error if command failed, e.g. no enough swap space for hibrernation
if [ -n "$err" ] && [ "$XDG_CURRENT_DESKTOP" = "Hyprland" ]; then
	hyprctl notify 3 10000 "rgb(960000)" " $err" > /dev/null
	# TODO: Show it also on Niri.
fi

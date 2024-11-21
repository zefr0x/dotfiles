#!/usr/bin/dash
# A rofi shell script to manage the session.

if [ "$ROFI_RETV" = "0" ]; then
	echo "Lock\0icon\0037system-lock-screen-symbolic\0037info\0037lock\n"
	echo "Logout\0icon\0037system-log-out-symbolic\0037info\0037logout\n"
	echo "Shutdown\0icon\0037system-shutdown-symbolic\0037info\0037shutdown\n"
	echo "Suspend\0icon\0037system-suspend-symbolic\0037info\0037suspend\n"
	echo "Hibernate\0icon\0037system-hibernate-symbolic\0037info\0037hibernate\n"
	echo "Hybrid Sleep\0icon\0037system-hibernate-symbolic\0037info\0037hybrid-sleep\n"
	echo "Suspend Then Hibernate\0icon\0037system-hibernate-symbolic\0037info\0037suspend-then-hibernate\n"
	echo "Reboot\0icon\0037system-reboot-symbolic\0037info\0037reboot\n"
	echo "Soft Reboot\0icon\0037system-reboot-symbolic\0037info\0037soft-reboot\n"
elif [ "$ROFI_RETV" = "1" ]; then
	case $ROFI_INFO in
	*lock)
		err=$(loginctl lock-session 2>&1)
		;;
	*logout)
		err=$(uwsm stop 2>&1)
		;;
	*shutdown)
		err=$(systemctl poweroff 2>&1)
		;;
	*suspend)
		err=$(systemctl suspend 2>&1)
		;;
	*hibernate)
		err=$(systemctl hibernate 2>&1)
		;;
	*hybrid-sleep)
		err=$(systemctl hybrid-sleep 2>&1)
		;;
	*suspend-then-hibernate)
		err=$(systemctl suspend-then-hibernate 2>&1)
		;;
	*reboot)
		err=$(systemctl reboot 2>&1)
		;;
	*soft-reboot)
		err=$(systemctl soft-reboot 2>&1)
		;;
	esac
fi

# Show the error if command failed, e.g. no enough swap space for hibrernation
if [ -n "$err" ] && [ "$XDG_CURRENT_DESKTOP" = "Hyprland" ]; then
	hyprctl notify 3 10000 "rgb(960000)" " $err" > /dev/null
	# TODO: Show it also on Niri.
fi

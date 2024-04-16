#!/usr/bin/dash
# A rofi shell script to manage the session.

if [ "$ROFI_RETV" = "0" ]; then
	echo "Lock\0icon\0037system-lock-screen-symbolic\0037info\0037lock\n"
	echo "Logout\0icon\0037system-log-out-symbolic\0037info\0037logout\n"
	echo "Suspend\0icon\0037system-suspend-symbolic\0037info\0037suspend\n"
	echo "Hibernate\0icon\0037system-hibernate-symbolic\0037info\0037hibernate\n"
	echo "Reboot\0icon\0037system-reboot-symbolic\0037info\0037reboot\n"
	echo "Shutdown\0icon\0037system-shutdown-symbolic\0037info\0037shutdown\n"
elif [ "$ROFI_RETV" = "1" ]; then
	case $ROFI_INFO in
	*lock)
		loginctl lock-session
		;;
	*logout)
		if [ "$XDG_CURRENT_DESKTOP" = "Hyprland" ]; then
			hyprctl dispatch exit
		fi
		;;
	*suspend)
		systemctl suspend
		;;
	*hibernate)
		systemctl hibernate
		;;
	*reboot)
		systemctl reboot
		;;
	*shutdown)
		systemctl poweroff -i
		;;
	esac
fi

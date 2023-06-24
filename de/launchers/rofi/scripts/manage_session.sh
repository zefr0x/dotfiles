#!/usr/bin/dash
# A rofi shell script to manage the session.

if [ "$ROFI_RETV" = "0" ]; then
	echo " Lock\0info\0037lock\n"
	echo "󰗽 Logout\0info\0037logout\n"
	echo "󰒲 Suspend\0info\0037suspend\n"
	echo "󰋊 Hibernate\0info\0037hibernate\n"
	echo "󰜉 Reboot\0info\0037reboot\n"
	echo " Shutdown\0info\0037shutdown\n"
elif [ "$ROFI_RETV" = "1" ]; then
	case $ROFI_INFO in
	*lock)
		loginctl lock-session
		;;
	*logout)
		i3-msg exit || hyprctl dispatch exit
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

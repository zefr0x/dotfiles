#!/usr/bin/bash
# A rofi bash script to manage the session.

if [[ $ROFI_RETV = 0 ]];
then
    echo -en " Lock\0info\x1flock\n"
    echo -en " Logout\0info\x1flogout\n"
    echo -en "鈴 Suspend\0info\x1fsuspend\n"
    echo -en " Hibernate\0info\x1fhibernate\n"
    echo -en "菱 Reboot\0info\x1freboot\n"
    echo -en " Shutdown\0info\x1fshutdown\n"
elif [[ $ROFI_RETV = 1 ]];
then
    case $ROFI_INFO in
        *lock)
            dm-tool lock
            ;;
        *logout)
            i3-msg exit
            ;;
        *suspend)
            dm-tool lock && sleep 1 && systemctl suspend
            ;;
        *hibernate)
            dm-tool lock && sleep 1 && systemctl hibernate
            ;;
        *reboot)
            systemctl reboot
            ;;
        *shutdown)
            systemctl poweroff -i
            ;;
    esac

fi

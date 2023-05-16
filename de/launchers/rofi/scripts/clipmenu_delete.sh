#!/usr/bin/dash
# A rofi shell script to delete entries in clipmenu.

if [ "$ROFI_RETV" = "1" ]; then
    clipdel -d "^${@}\$"
fi

CM_LAUNCHER='rofi-script' clipmenu

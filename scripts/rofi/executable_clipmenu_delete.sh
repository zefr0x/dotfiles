#!/usr/bin/bash
# A rofi bash script to delete entries in clipmenu.

if [[ $ROFI_RETV = 1 ]]; then
    clipdel -d "^${@}\$"
fi

CM_LAUNCHER='rofi-script' clipmenu

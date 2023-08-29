#!/usr/bin/dash
# Script to use screen shader in Hyprland to protect your eye in the night, and disable the shader in the morning.

state=0

while true; do
    hour=$(date +'%H')

    if [ $state = 0 ] && ([ $hour -ge 18 ] || [ $hour -le 5 ])
    then
        hyprctl reload
        hyprctl keyword decoration:screen_shader "~/.config/hypr/color_temperature_shader.glsl"

        state=1
    elif [ $state = 1 ] && [ $hour -gt 5 ]
    then
        hyprctl keyword decoration:screen_shader ""

        state=0
    fi

    sleep 3600
done

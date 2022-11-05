#!/usr/bin/env bash
# Script to autostart and restart polybar.

# Terminate already running bar instances.
polybar-msg cmd quit

monitors_list=($(polybar --list-monitors | cut -d":" -f1))

# Start the primary bar in the primary monitor.
MONITOR=${monitors_list[0]} polybar --reload primary &
unset monitors_list[0]

# Start the secondary bar in the other monitors.
for monitor in ${monitors_list[@]}; do
	MONITOR=$monitor polybar --reload secondary &
done

echo "Bars launched..."

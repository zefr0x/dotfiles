#!/usr/bin/dash
# Script to autostart and restart polybar.

export POLYBAR_SHELL="/usr/bin/dash"

# Terminate already running bar instances.
polybar-msg cmd quit

set -- $(polybar --list-monitors | cut -d":" -f1)

# Start the primary bar in the primary monitor.
MONITOR=$1 polybar --reload primary &
shift 1

# Start the secondary bar in the other monitors.
for monitor in $@; do
	MONITOR=$monitor polybar --reload secondary &
done

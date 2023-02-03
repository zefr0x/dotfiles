#!/usr/bin/dash
# Get the last selected text from any window in `X11` or `Wayland` then open it in `GNOME Dialect`, which is a translating app.
# This script is assigned to a hotkey in the window manager to make it easy to translate any text.

if [ "$XDG_SESSION_TYPE" = "x11" ]; then
	selection_text=$(xclip -selection primary -o)
elif [ "$XDG_SESSION_TYPE" = "wayland" ]; then
	selection_text=$(wl-paste -p)
else
	echo >&2 "Error: The \$XDG_SESSION_TYPE variable is not properly selected or not supported."
	exit 1
fi

if [ "$selection_text" ]; then
	dialect --text "$selection_text"
else
	echo >&2 "Error: No text is currently selected."
	exit 1
fi

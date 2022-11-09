#!/usr/bin/python
"""
Get the last selected text from any window in `X11` or `Wayland` then open it in `GNOME Dialect`, which is a translating app.

This script is assigned to a hotkey in the window manager to make it easy to translate any text.
"""
from os import environ
from subprocess import run, PIPE

xdg_session_type = environ.get("XDG_SESSION_TYPE")

if xdg_session_type == "wayland":
    command = ["wl-paste", "-p"]
elif xdg_session_type == "x11":
    command = ["xclip", "-selection", "primary", "-o"]
else:
    raise SystemExit("No supported XDG session type is available.")

selection_text = run(command, stdout=PIPE).stdout.decode()

run(["dialect", "--text", selection_text, "--dest", "ar"])

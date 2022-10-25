#!/usr/bin/python
"""
Get the selected text then open it in google translate.

Of course google translate will be redirected to an alternative frontend later in the browser.

This script is assigned to a hotkey in the window manager so it would be easy to translate text.
"""
from os import environ
from subprocess import run, PIPE
from urllib.parse import quote
from webbrowser import open

xdg_session_type = environ.get("XDG_SESSION_TYPE")

if xdg_session_type == "wayland":
    command = ["wl-paste", "-p"]
elif xdg_session_type == "x11":
    command = ["xclip", "-selection", "primary", "-o"]
else:
    raise SystemExit("No supported XDG session type is available.")

selection_text = run(command, stdout=PIPE).stdout.decode()

open(f"https://translate.google.com/?text={quote(selection_text)}&sl=auto&tl=ar")

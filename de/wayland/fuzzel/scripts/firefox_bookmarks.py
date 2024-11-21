#!/usr/bin/python
"""A fuzzel python script that uses foxmarks to list and launch firefox bookmarks."""

import subprocess
from webbrowser import open as open_url

bookmarks = subprocess.Popen(["/usr/bin/foxmarks", "bookmarks"], stdout=subprocess.PIPE)  # noqa: S603
fuzzel = subprocess.Popen(  # noqa: S603
    ["/usr/bin/fuzzel", "--dmenu"], stdout=subprocess.PIPE, stdin=subprocess.PIPE
)

urls = {}

while bookmark := bookmarks.stdout.readline().decode():  # type: ignore[union-attr]
    bookmark = bookmark.split(";")
    try:
        title = bookmark[0]
    except IndexError:
        title = ""
    try:
        url = bookmark[1]
    except IndexError:
        url = ""

    fuzzel.stdin.write(f"{title}\0icon\x1fbookmarks\n".encode())  # type: ignore[union-attr]
    urls[title] = url

fuzzel.stdin.close()  # type: ignore[union-attr]

fuzzel.wait(None)

open_url(urls[fuzzel.stdout.readline().decode("utf-8").strip()])  # type: ignore[union-attr]

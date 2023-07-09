#!/usr/bin/python
"""A rofi python script that uses foxmarks to list and launch firefox bookmarks."""
from os import environ

if environ.get("ROFI_RETV") == "0":
    import subprocess

    results = (
        subprocess.run(["foxmarks", "bookmarks"], stdout=subprocess.PIPE)
        .stdout.decode()
        .splitlines()
    )
    for result in results:
        result_splited = result.split(";")
        try:
            title = result_splited[0]
        except IndexError:
            title = ""
        try:
            url = result_splited[1]
        except IndexError:
            url = ""

        print(f"{title}\0icon\x1fbookmarks\x1fmeta\x1f{url}\x1finfo\x1f{url}\x1f\n")

elif environ.get("ROFI_RETV") == "1":
    from webbrowser import open

    open(f"{environ.get('ROFI_INFO') or ''}")

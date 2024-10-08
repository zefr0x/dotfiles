#!/usr/bin/python
"""A rofi python script to list zoom meetings and open them."""

import subprocess
from os import environ
from pathlib import Path


def load_meetings() -> list[dict[str, str]]:
    """Load meetings list from `.zoom_meetings` file."""
    meetings = []

    with Path.open(Path.joinpath(Path.home(), ".zoom_meetings"), "r") as file:
        for line in file.readlines():
            results = line.strip().split(";")

            passcode: str = results.pop()

            meeting_id: str = results.pop()

            name: str = results.pop()

            meeting_uri = f"https://zoom.us/wc/join/{meeting_id}" + (
                "?pwd=" + passcode if passcode else ""
            )
            meetings.append({"name": name, "uri": meeting_uri})

    return meetings


if environ.get("ROFI_RETV") == "0":
    meetings = load_meetings()
    for meeting in meetings:
        print(
            f"{meeting['name']}\0icon\x1fcamera-web\x1finfo\x1f{meeting['uri']}\x1f\n"
        )
elif environ.get("ROFI_RETV") == "1":
    subprocess.call(["/usr/bin/gio", "open", environ.get("ROFI_INFO") or ""])  # noqa: S603
elif environ.get("ROFI_RETV") == "2":
    # TODO: Accept opening a meeting directly with it's ID
    pass

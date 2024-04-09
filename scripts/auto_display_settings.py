#!/usr/bin/python
"""Change display settings depending on dawn/dusk time to save my eyes."""

import subprocess
from datetime import datetime
from os import environ
from pathlib import Path
from time import sleep

TEMP_DAY = 4000.0
TEMP_NIGHT = 2650.0

DAWN_TIME = 21600.0  # 6am (Should be > WINDOW)
DUSK_TIME = 64800.0  # 6pm (Shoulbe be > WINDOW + DAWN_TIME)

# Time during which the temperature changes gradually until it reaches the desired value
WINDOW = 900  # 15m

control_file = Path(environ["XDG_RUNTIME_DIR"]).joinpath(
    "auto-display-settings-disabled"
)
temp = None

# NOTE: This is done only one time when the script starts, which reduces accuracy.
now = datetime.now().astimezone()
# Initiate with seconds since the beginning of day
current_time = now.hour * 3600 + now.minute * 60 + now.second

while True:
    if DAWN_TIME - WINDOW < current_time < DAWN_TIME:
        temp = (DAWN_TIME - current_time) * (TEMP_NIGHT - TEMP_DAY) / WINDOW + TEMP_DAY
    elif DUSK_TIME - WINDOW < current_time < DUSK_TIME:
        temp = (DUSK_TIME - current_time) * (
            TEMP_DAY - TEMP_NIGHT
        ) / WINDOW + TEMP_NIGHT
    elif current_time >= DUSK_TIME or current_time < DAWN_TIME:
        temp = TEMP_NIGHT
    elif current_time >= DAWN_TIME or current_time < DUSK_TIME:
        temp = TEMP_DAY

    if temp:
        subprocess.run(
            [  # noqa: S603
                "/usr/bin/busctl",
                "--user",
                "set-property",
                "rs.wl-gammarelay",
                "/",
                "rs.wl.gammarelay",
                "Temperature",
                "q",
                str(int(temp)),
            ]
        )

    # NOTE: Calculatig current_time manually improves performance, but reduces accuracy.
    current_time += 2

    while True:
        sleep(2)

        # Method to stop auto change of settings (for manual change).
        if not control_file.is_file():
            break

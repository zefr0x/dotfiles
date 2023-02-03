#!/usr/bin/python3
"""Script that runs a command/s multible times and print the shortest run-time."""
from argparse import ArgumentParser
from subprocess import call
from subprocess import DEVNULL
from time import monotonic


def main() -> int:
    """Run main function."""
    parser = ArgumentParser()
    parser.add_argument("-n", type=int, default=10)
    parser.add_argument("cmd", nargs="+")
    args = parser.parse_args()

    print(args)

    best: float = float("inf")
    for _ in range(args.n):
        t0 = monotonic()
        call(args.cmd, stdout=DEVNULL, stderr=DEVNULL)
        best = min(best, monotonic() - t0)
        print(".", end="", flush=True)

    print(f"\nbest of {args.n}: {best}s")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

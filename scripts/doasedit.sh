#!/bin/dash

# Source: https://github.com/AN3223/scripts/blob/18d64c5b659e447f33b59adf3e38a587f471dc85/doasedit

set -e

help() {
	cat - >&2 <<EOF
doasedit - like sudoedit, but for doas

doasedit file...

Every argument will be treated as a file to edit. There's no support for
passing arguments to doas, so you can only doas root.

This script is SECURITY SENSITIVE! Special care has been taken to correctly
preserve file attributes. Please exercise CAUTION when modifying AND using
this script.
EOF
}

case "$1" in --help|-h) help; exit 0;; esac

export TMPDIR=$XDG_RUNTIME_DIR
trap 'trap - EXIT HUP QUIT TERM INT ABRT; rm -f "$tmp" "$tmpcopy"' EXIT HUP QUIT TERM INT ABRT

for file; do
	case "$file" in -*) file=./"$file" ;; esac

	tmp="$(mktemp)"
	if [ -f "$file" ] && [ ! -r "$file" ]; then
		doas cat "$file" > "$tmp"
	elif [ -r "$file" ]; then
		cat "$file" > "$tmp"
	fi

	tmpcopy="$(mktemp)"
	cat "$tmp" > "$tmpcopy"

	${EDITOR} "$tmp"

	if cmp -s "$tmp" "$tmpcopy"; then
		echo 'File unchanged, exiting...'
	else
		doas dd if="$tmp" of="$file"
		echo 'Done, changes written'
	fi

	rm "$tmp" "$tmpcopy"
done

#!/bin/sh
# Statefull random wallpaper setter.

# Create a list of shuffled wallpapers
WALLPAPERS_DIR="$HOME/Pictures/wallpapers/"
WALLPAPERS_LIST="$XDG_RUNTIME_DIR/wallpapers_list"

if [ ! -f $WALLPAPERS_LIST ] || [ $(wc -w < $WALLPAPERS_LIST) -eq 0 ]; then
   find $WALLPAPERS_DIR -type f | shuf > $WALLPAPERS_LIST
fi

# Pop the last wallpaper in the list
WALLPAPER=$(tail -n 1 $WALLPAPERS_LIST)
sed -i '$d' $WALLPAPERS_LIST

# Get the previous wallpaper process.
PREV=$(pidof swaybg)

# Set the new wallpaper
swaybg --image $WALLPAPER &
sleep 1

# Kill the previous one.
kill $PREV

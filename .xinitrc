#!/bin/bash
xrandr --output DP-1 --mode 3840x2160
xrandr --output DVI-I-1 --auto --right-of DP-1

SOLID_COLOR="$(mktemp).png"
convert -size 1x1 xc:#000000 $SOLID_COLOR
feh --bg-center $SOLID_COLOR
rm $SOLID_COLOR

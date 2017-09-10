#!/bin/bash
xrandr --output DP-1 --mode 3840x2160
xrandr --output DVI-I-1 --auto --right-of DP-1

feh --bg-fill ~/.wallpapers/fractals.png

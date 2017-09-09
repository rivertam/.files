#!/bin/zsh

bgcolor="#000000"
inactivebgcolor="#111111"
textcolor="#d3d3d3"
inactivetextcolor="#999999"
urgentbgcolor="#339933"
bordercolor="#ffffff"

rofi -run-command "zsh -i -c '{cmd}'" -show run -lines 3 -eh 2 -width 75 -padding 100 -opacity "90%" -bw 0 -bc "$bgcolor" -bg "$bgcolor" -fg "$textcolor" -hlbg "$bgcolor" -hlfg "#9575cd" -font "System San Francisco Display 18"

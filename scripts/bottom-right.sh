#!/bin/zsh

x="$(i3-msg -t get_tree | jq '.nodes[1].rect.x')"
screenwidth="$(i3-msg -t get_tree | jq '.nodes[1].rect.width')"
screenheight="$(i3-msg -t get_tree | jq '.nodes[1].rect.height')"

window=${1:-"${xdotool getactivewindow}"}

unset winwidth winheight
eval $(xwininfo -id $window |
  sed -n -e "s/^ \+Width: \+\([0-9]\+\).*/winwidth=\1/p" \
         -e "s/^ \+Height: \+\([0-9]\+\).*/winheight=\1/p" )


newx=$(expr $x + $screenwidth - $winwidth)
newy=$(expr $screenheight - $winheight)

xdotool windowmove $window $newx $newy

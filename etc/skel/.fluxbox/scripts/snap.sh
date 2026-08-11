#!/usr/bin/env bash
# Simula snapping tipo tiling (Sway/Hyprland) no Fluxbox.
# Requer: wmctrl, xdotool
# Uso: snap.sh [left|right|top|bottom|fullscreen]

GAP=10  # "gap" falso, simulando o respiro visual do sway/hyprland

read -r SW SH <<< "$(xdotool getdisplaygeometry)"
WIN=$(xdotool getactivewindow)

wmctrl -ir "$WIN" -b remove,maximized_vert,maximized_horz

case "$1" in
  left)
    xdotool windowsize "$WIN" $(( SW/2 - GAP*2 )) $(( SH - GAP*2 ))
    xdotool windowmove "$WIN" "$GAP" "$GAP"
    ;;
  right)
    xdotool windowsize "$WIN" $(( SW/2 - GAP*2 )) $(( SH - GAP*2 ))
    xdotool windowmove "$WIN" $(( SW/2 + GAP )) "$GAP"
    ;;
  top)
    xdotool windowsize "$WIN" $(( SW - GAP*2 )) $(( SH/2 - GAP*2 ))
    xdotool windowmove "$WIN" "$GAP" "$GAP"
    ;;
  bottom)
    xdotool windowsize "$WIN" $(( SW - GAP*2 )) $(( SH/2 - GAP*2 ))
    xdotool windowmove "$WIN" "$GAP" $(( SH/2 + GAP ))
    ;;
  fullscreen)
    wmctrl -ir "$WIN" -b toggle,fullscreen
    ;;
  *)
    echo "uso: snap.sh [left|right|top|bottom|fullscreen]"
    ;;
esac

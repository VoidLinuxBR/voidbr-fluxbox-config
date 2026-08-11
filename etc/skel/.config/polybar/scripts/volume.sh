#!/bin/sh
# LC_ALL=C forca saida em ingles do pactl, independente do idioma do sistema
vol=$(LC_ALL=C pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null | grep -m1 -o '[0-9]*%' | head -n1 | tr -d '%')
mute=$(LC_ALL=C pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null | awk '{print $2}')

if [ "$mute" = "yes" ]; then
  echo "%{T2}%{T-}  mudo"
  exit 0
fi

[ -z "$vol" ] && exit 0

if [ "$vol" -ge 60 ]; then
  icon=""
elif [ "$vol" -ge 30 ]; then
  icon=""
else
  icon=""
fi

echo "%{T2}$icon%{T-} ${vol}%"

#!/bin/sh
# Detecta bateria automaticamente. Sem saida = modulo some sozinho.
bat=$(ls /sys/class/power_supply/ 2>/dev/null | grep -m1 '^BAT')
[ -z "$bat" ] && exit 0

cap=$(cat "/sys/class/power_supply/$bat/capacity" 2>/dev/null)
status=$(cat "/sys/class/power_supply/$bat/status" 2>/dev/null)
[ -z "$cap" ] && exit 0

if [ "$status" = "Charging" ]; then
  icon=""
elif [ "$cap" -ge 80 ]; then icon=""
elif [ "$cap" -ge 60 ]; then icon=""
elif [ "$cap" -ge 40 ]; then icon=""
elif [ "$cap" -ge 20 ]; then icon=""
else icon=""
fi

echo "%{T2}$icon%{T-} ${cap}%"

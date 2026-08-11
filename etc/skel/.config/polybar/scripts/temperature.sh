#!/bin/sh
# Detecta sensor de temperatura da CPU automaticamente. Sem saida = modulo some sozinho.
temp_file=""
for hw in /sys/class/hwmon/hwmon*; do
  [ -f "$hw/name" ] || continue
  name=$(cat "$hw/name" 2>/dev/null)
  case "$name" in
    coretemp|k10temp|zenpower|cpu_thermal)
      temp_file="$hw/temp1_input"
      break
      ;;
  esac
done

[ -z "$temp_file" ] && temp_file=$(ls /sys/class/hwmon/hwmon*/temp1_input 2>/dev/null | head -n1)
[ -z "$temp_file" ] || [ ! -f "$temp_file" ] && exit 0

raw=$(cat "$temp_file" 2>/dev/null)
[ -z "$raw" ] && exit 0
c=$(( raw / 1000 ))

echo "%{T2}%{T-} ${c}°C"

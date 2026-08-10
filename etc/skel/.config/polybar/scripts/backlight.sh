#!/bin/sh
# Detecta controle de brilho automaticamente. Sem saida = modulo some sozinho.
bl=$(ls /sys/class/backlight/ 2>/dev/null | head -n1)
[ -z "$bl" ] && exit 0

raw=$(cat "/sys/class/backlight/$bl/brightness" 2>/dev/null)
max=$(cat "/sys/class/backlight/$bl/max_brightness" 2>/dev/null)
[ -z "$raw" ] || [ -z "$max" ] || [ "$max" -eq 0 ] && exit 0

pct=$(( raw * 100 / max ))
echo "%{T2}%{T-} ${pct}%"

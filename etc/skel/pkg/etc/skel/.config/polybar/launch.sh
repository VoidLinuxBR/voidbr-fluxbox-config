#!/usr/bin/env bash
# Mata instâncias antigas do polybar e sobe de novo com o config Tokyo Night

killall -q polybar

while pgrep -u "$UID" -x polybar >/dev/null; do sleep 1; done

polybar main -c "$HOME/.config/polybar/config.ini" &

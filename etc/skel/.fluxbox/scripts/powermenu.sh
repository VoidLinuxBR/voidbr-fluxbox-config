#!/usr/bin/env bash
if [ -z "$1" ]; then
  echo "⏻  Desligar"
  echo "  Reiniciar"
  echo "  Logout"
  echo "  Suspender"
  echo "  Travar"
  exit 0
fi

case "$1" in
  *Desligar*)   loginctl poweroff ;;
  *Reiniciar*)  loginctl reboot ;;
  *Logout*)     fluxbox-remote quit ;;
  *Suspender*)  loginctl suspend ;;
  *Travar*)     i3lock -c 1a1b26 ;;
esac

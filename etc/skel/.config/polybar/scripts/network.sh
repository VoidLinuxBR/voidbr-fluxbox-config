#!/bin/sh
# Detecta a interface de rede ativa automaticamente (cabo ou wifi).
iface=$(ip route 2>/dev/null | awk '/^default/ {print $5; exit}')

if [ -z "$iface" ]; then
  echo "%{T2}%{T-} offline"
  exit 0
fi

case "$iface" in
  wl*) icon="" ;;
  *)   icon=""  ;;
esac

echo "%{T2}$icon%{T-} $iface"

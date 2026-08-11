#!/bin/sh
# Mostra o estado da conexao gerenciada pelo NetworkManager
state=$(nmcli -t -f STATE general status 2>/dev/null)

case "$state" in
  connected)
    type=$(nmcli -t -f TYPE,STATE device 2>/dev/null | grep ":connected" | head -n1 | cut -d: -f1)
    if [ "$type" = "wifi" ]; then
      echo "%{T2}%{T-}"
    else
      echo "%{T2}%{T-}"
    fi
    ;;
  connecting*)
    echo "%{T2}%{T-}"
    ;;
  *)
    echo "%{T2}%{T-}"
    ;;
esac

#!/bin/sh
# Conta quantos pacotes o xbps tem para atualizar
count=$(xbps-install -Sun 2>/dev/null | wc -l)

if [ "$count" -gt 0 ]; then
  echo "$count atualizações"
else
  echo "em dia"
fi

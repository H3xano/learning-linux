#!/bin/bash
set -euo pipefail

missing=()
for cmd in id groups history; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    missing+=("$cmd")
  fi
done

if [[ ${#missing[@]} -gt 0 ]]; then
  echo "Commandes manquantes : ${missing[*]}" >&2
  exit 1
fi

if command -v cal >/dev/null 2>&1; then
  echo "Commande cal disponible."
elif command -v ncal >/dev/null 2>&1; then
  echo "Commande ncal disponible. Vous pouvez l'utiliser a la place de cal."
else
  echo "Ni cal ni ncal ne sont installes. Vous pouvez installer util-linux ou utiliser un calendrier en ligne si besoin."
fi

echo "Les commandes d'analyse systeme sont accessibles. Continuez avec la creation du rapport."

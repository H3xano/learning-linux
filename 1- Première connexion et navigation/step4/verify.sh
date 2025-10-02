#!/bin/bash
set -euo pipefail

shopt -s nullglob
reports=("$HOME"/rapport_session_*.txt)

if (( ${#reports[@]} == 0 )); then
  echo "Aucun rapport detecte. Revenez a l'etape precedente." >&2
  exit 1
fi

echo "Rapport present. Pensez a conserver votre capture d'ecran pour validation." 

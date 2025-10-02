#!/bin/bash
set -euo pipefail

shopt -s nullglob
reports=("$HOME"/rapport_session_*.txt)

if (( ${#reports[@]} == 0 )); then
  echo "Aucun fichier rapport_session_*.txt trouve dans $HOME" >&2
  exit 1
fi

latest=$(ls -t "${reports[@]}" | head -n1)

required_patterns=(
  "RAPPORT DE SESSION LINUX REUSSI"
  "--- IDENTITE COMPLETE ---"
  "--- CONTEXTE TEMPOREL ---"
  "--- ETAT SYSTEME ---"
  "MODULE 1 TERMINE AVEC SUCCES"
)

for pattern in "${required_patterns[@]}"; do
  if ! grep -q -- "$pattern" "$latest"; then
    echo "Le rapport $latest ne contient pas la section attendue : $pattern" >&2
    exit 1
  fi
done

echo "Rapport detecte : $latest"

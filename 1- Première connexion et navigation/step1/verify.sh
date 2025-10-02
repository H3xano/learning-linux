#!/bin/bash
set -euo pipefail

missing=()
for cmd in whoami date uptime; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    missing+=("$cmd")
  fi
done

if [[ ${#missing[@]} -gt 0 ]]; then
  echo "Commandes manquantes : ${missing[*]}" >&2
  exit 1
fi

echo "Les commandes de base sont disponibles. Vous pouvez poursuivre."

#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie la création du premier dossier
found 'find ~ -name "secret_rapport.txt"' || exit 1

# Vérifie la création de la structure avec -p
found 'find ~ -iname "rapport_final.pdf"' || exit 1

# Vérifie la création de la structure avec -p
found 'find ~/archives -name "*.' || exit 1

echo -n "done"
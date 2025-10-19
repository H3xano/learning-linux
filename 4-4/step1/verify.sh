#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie la création du premier dossier
found 'mkdir mon_projet' || exit 1

# Vérifie la création de la structure avec -p
found 'mkdir -p mon_projet/{src,docs,tests}' || exit 1

echo -n "done"
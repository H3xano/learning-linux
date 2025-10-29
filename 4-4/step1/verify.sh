#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie la création de la structure avec -p et -v
if ! (found 'mkdir -p' && (found 'mkdir -v' || found 'mkdir -pv')); then
    exit 1
fi

# Vérifie la mise à jour du timestamp
found 'touch mon_projet/README.md' || exit 1
found 'ls -l mon_projet/README.md' || exit 1

echo -n "done"
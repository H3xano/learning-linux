#!/bin/bash
set -e
# Vérifie que .bashrc contient l'alias et la fonction
if ! grep -q "alias ll=" /home/learner/.bashrc || ! grep -q "mkcd()" /home/learner/.bashrc; then
    exit 1
fi
# Vérifie que la fonction a été testée
FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'mkcd mon-super-projet' || exit 1
echo -n "done"
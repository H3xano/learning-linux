#!/bin/bash
set -e
# Vérifie que .bash_profile a été créé et que la simulation de login a été tentée
if ! grep -q "Bienvenue" /home/learner/.bash_profile; then
    exit 1
fi
FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'bash --login' || exit 1
echo -n "done"
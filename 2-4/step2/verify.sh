#!/bin/bash
set -e
# Vérifie que .bashrc a bien été modifié et rechargé
if ! grep -q "alias ll='ls -lah'" /home/learner/.bashrc || ! grep -q 'export LOG_DIR' /home/learner/.bashrc; then
    exit 1
fi
# Vérifie que les commandes ont été exécutées
FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found '^ll$' || exit 1
found 'ls \$LOG_DIR' || exit 1
echo -n "done"
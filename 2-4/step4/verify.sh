#!/bin/bash
set -e
# Vérifie que le prompt intelligent a bien été ajouté au .bashrc
if ! grep -q 'if \[ \$? = 0 \]' /home/learner/.bashrc; then
    exit 1
fi
# Vérifie que la commande d'échec a été tentée
FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found '^lss$' || exit 1
echo -n "done"
#!/bin/bash
set -e
# Vérifie que le PS1 a été ajouté au .bashrc
if ! grep -q 'PS1="${GREEN}\u@\h${RESET}' /home/learner/.bashrc; then
    exit 1
fi
FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found '^cd /etc$' || exit 1
echo -n "done"
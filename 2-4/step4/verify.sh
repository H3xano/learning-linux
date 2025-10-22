#!/bin/bash
set -e
# Vérifie que les options ont bien été ajoutées
if ! grep -q "export HISTCONTROL=ignoreboth" /home/learner/.bashrc || ! grep -q "shopt -s cdspell" /home/learner/.bashrc; then
    exit 1
fi
FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'cd /hoem' || exit 1
echo -n "done"
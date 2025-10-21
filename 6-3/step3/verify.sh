#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie que les commandes ont été tapées
found 'sudo chmod u+s suid_prog' || found 'sudo chmod 4755 suid_prog' || exit 1
found './suid_prog' || exit 1

# Vérifie que le SUID est bien actif
if ! [[ $(./suid_prog) == *"EUID: 0"* ]]; then
  exit 1
fi

echo -n "done"
#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found 'locate sshd_config' || exit 1
found 'touch ~/mon_fichier_tout_neuf.txt' || exit 1
found 'sudo updatedb' || exit 1
found 'locate mon_fichier_tout_neuf.txt' || exit 1

echo -n "done"
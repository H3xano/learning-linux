#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found 'cd ~/A/B' || exit 1
found 'ls /home/learner/mon_dossier' || exit 1
found 'ls \.\./\.\./mon_dossier' || exit 1
found 'ln -s ~/mon_dossier ~/raccourci' || exit 1
found 'cd ~/raccourci' || exit 1
found 'pwd -P' || exit 1

echo -n "done"
#!/bin/bash
set -e
[ -f script_condition.sh ] || exit 1
grep -q '\[.*-f.*\] && \[.*-r.*\]' script_condition.sh || exit 1
grep -q '\[ "\$#" -ne 1 \]' script_condition.sh || exit 1

FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found './script_condition.sh /etc/hostname' || exit 1
found './script_condition.sh /un/fichier/inexistant' || exit 1
found './script_condition.sh' || exit 1

echo -n "done"
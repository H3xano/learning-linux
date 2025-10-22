#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'sudo cat /etc/shadow' || exit 1
found 'sudo -l' || exit 1
found 'sudo -i' || exit 1
if [[ $(whoami) != "learner" ]]; then exit 1; fi
echo -n "done"
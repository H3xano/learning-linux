#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found 'sudo cat /etc/shadow' || exit 1
found 'echo "127.0.0.1 test-tee" \| sudo tee -a /etc/hosts' || exit 1
found 'sudo -l' || exit 1
found 'sudo -i' || exit 1
found 'sudo -u root whoami' || exit 1

echo -n "done"
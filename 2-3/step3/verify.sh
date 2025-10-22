#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'sudo ls -l /root' || exit 1
found 'sudo grep "sudo" /var/log/auth.log' || exit 1
found 'sudo cat /etc/sudoers' || exit 1
echo -n "done"
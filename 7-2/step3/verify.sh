#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found 'journalctl --since "1 hour ago" -p err' || exit 1
found 'tail /var/log/syslog' || exit 1
found 'grep -i "authentication failure" /var/log/auth.log' || exit 1

echo -n "done"
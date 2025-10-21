#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'sudo chmod 000 /var/www/html/.env' || exit 1
found 'sudo tail -n 20 /var/log/nginx/error.log' || exit 1
found 'sudo chmod 600 /var/www/html/.env' || exit 1
# Final validation
if ! curl -f http://localhost > /dev/null 2>&1; then exit 1; fi
echo -n "done"
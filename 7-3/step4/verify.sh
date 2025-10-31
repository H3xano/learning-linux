#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'df -h' || exit 1
found 'sudo du -sh /var/\*' || exit 1
found 'sudo rm /var/log/nginx/access.log.old' || exit 1
found 'nano backup_site.sh' || exit 1
found 'chmod +x backup_site.sh' || exit 1
found 'sudo ./backup_site.sh' || exit 1
echo -n "done"
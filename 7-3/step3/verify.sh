# step3/verify.sh
#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'sudo tail -f /var/log/nginx/access.log' || exit 1
found 'sudo grep "File not found" /var/log/nginx/error.log' || exit 1
found "awk '{print \$1}' /var/log/nginx/access.log" || exit 1
echo -n "done"
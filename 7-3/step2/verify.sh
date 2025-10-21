# step2/verify.sh
#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'sudo systemctl status nginx' || exit 1
found 'sudo nginx -t' || exit 1
found 'sudo systemctl reload nginx' || exit 1
found 'sudo systemctl stop nginx' || exit 1
found 'sudo systemctl start nginx' || exit 1
echo -n "done"

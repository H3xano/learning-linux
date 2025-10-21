# step1/verify.sh
#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'tar -xzf mon_app.tar.gz' || exit 1
found 'sudo mv mon_app/\* /var/www/html/' || exit 1
found 'sudo chmod 600 /var/www/html/.env' || exit 1
echo -n "done"
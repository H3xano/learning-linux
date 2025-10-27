# step5/verify.sh
#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'locale \| grep LANG' || found 'locale | grep LANG' || exit 1
found 'echo "Le PID de mon shell est \$\$"' || exit 1
found 'echo "Mon éditeur par défaut est : \$EDITOR"' || exit 1
echo -n "done"
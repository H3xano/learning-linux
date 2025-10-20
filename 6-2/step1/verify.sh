# step1/verify.sh
#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'ls -l' || exit 1
found 'whoami' || exit 1
found 'groups' || exit 1
found 'id' || exit 1
echo -n "done"
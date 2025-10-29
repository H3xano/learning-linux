#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'ls -l fichier_acl.txt' || exit 1
found 'getfacl fichier_acl.txt' || exit 1
found 'sudo -u specific_user cat /home/learner/fichier_acl.txt' || exit 1
echo -n "done"
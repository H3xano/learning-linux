#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'tar -czf backup-\$(date' || exit 1
found 'echo ".*ls \*\.txt | wc -l"' || found 'echo ".*ls \*\.txt \| wc -l"' || exit 1
found 'echo "Nouveau nom : \${FICHIER%.jpeg}.jpg"' || exit 1
echo -n "done"
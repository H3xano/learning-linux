# step4/verify.sh
#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'echo ".*env | wc -l"' || found 'echo ".*env \| wc -l"' || exit 1
found 'echo ".*set | wc -l"' || found 'echo ".*set \| wc -l"' || exit 1
found 'echo \$PATH | tr' || found 'echo \$PATH \| tr' || exit 1
found 'echo "Code de retour : \$\?"' || exit 1
echo -n "done"
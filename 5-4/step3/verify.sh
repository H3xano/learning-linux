# step3/verify.sh
#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found 'ln -s data/source.txt' || exit 1
found 'mv lien_relatif /tmp/' || exit 1
found 'cat /tmp/lien_relatif' || exit 1

echo -n "done"
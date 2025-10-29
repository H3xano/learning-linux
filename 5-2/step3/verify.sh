# step3/verify.sh
#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found '2> erreurs.log' || exit 1
found '2>> erreurs.log' || exit 1
found '> tout_en_un.log 2>&1' || exit 1
found '&> tout_en_un_moderne.log' || exit 1
echo -n "done"
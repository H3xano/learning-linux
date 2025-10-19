# step1/verify.sh
#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'ls /etc /un_dossier_qui_n_existe_pas' || exit 1
echo -n "done"
#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found 'nano script_params.sh' || exit 1
found './script_params.sh Formip' || exit 1
found './script_params.sh$' || exit 1 # Pour la version sans paramètre

echo -n "done"
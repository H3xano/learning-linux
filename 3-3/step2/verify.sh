#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie l'utilisation des classes de caractères []
found 'grep -E ".*\[.*"' || found 'egrep ".*\[.*"' || exit 1

# Vérifie l'utilisation de l'ancrage ^ ou $
if found 'grep -E ".*^.*"' || found 'egrep ".*^.*"' || found 'grep -E ".*\$"' || found 'egrep ".*\$"'; then
  echo -n "done"
else
  exit 1
fi
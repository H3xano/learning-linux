#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie que l'étudiant a bien utilisé grep avec l'option -E (ou egrep)
if found 'grep -E' || found 'egrep'; then
  echo -n "done"
else
  exit 1
fi
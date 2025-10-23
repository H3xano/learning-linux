#!/bin/bash
set -e
FILES=("/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -qF "$p" "$f" && return 0; done; return 1; }

found 'sleep 30' || exit 1
found 'echo "Je travaille en parallèle !"' || exit 1

echo -n "done"
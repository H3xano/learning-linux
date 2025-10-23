#!/bin/bash
set -e
FILES=("/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -qF "$p" "$f" && return 0; done; return 1; }

found 'date' || exit 1
found 'cal' || exit 1
found 'uptime' || exit 1

echo -n "done"
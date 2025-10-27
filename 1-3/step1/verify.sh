#!/bin/bash
set -e
FILES=("/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -qF "$p" "$f" && return 0; done; return 1; }

found 'whoami' || exit 1
found 'id' || exit 1
found 'groups' || exit 1
found 'id -un' || exit 1
found 'id root' || exit 1

echo -n "done"
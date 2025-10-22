#!/bin/bash
set -e; FILES=("$HOME/.bashhistory" "/home/learner/.bashhistory"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'nano ~/.bashrc' || exit 1
found 'source ~/.bashrc' || exit 1
echo -n "done"
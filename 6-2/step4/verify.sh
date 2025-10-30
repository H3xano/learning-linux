#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found 'sudo chgrp webteam site_config.conf' || exit 1
found 'chgrp equipe site_config.conf' || exit 1

echo -n "done"
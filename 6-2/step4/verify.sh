# step4/verify.sh
#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'ls -lR projet_alpha' || exit 1
found 'sudo chown -R testuser:equipe projet_alpha' || exit 1
echo -n "done"
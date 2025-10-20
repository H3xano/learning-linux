# step4/verify.sh
#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'chmod g+s shared_folder/' || found 'chmod 2775 shared_folder/' || exit 1
found 'touch shared_folder/mon_fichier_partage.txt' || exit 1
found 'chmod +t public_space/' || found 'chmod 1777 public_space/' || exit 1
echo -n "done"
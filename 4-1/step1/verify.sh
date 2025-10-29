set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found 'ls /bin' || exit 1
found 'ls /sbin' || exit 1
found 'cat /etc/hostname' || exit 1
found 'ls -lh /boot' || exit 1
found '> /dev/null' || exit 1

echo -n "done"
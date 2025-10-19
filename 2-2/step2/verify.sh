#!/bin/bash
# Step2 - verify.sh
# Must print only "done" on success and exit 0. Any other output = failure.

set -e

# Collect plausible history files (current shell, learner, root)
H1=$(eval echo "${HISTFILE:-$HOME/.bash_history}")
FILES=("$H1" "/home/learner/.bash_history" "/root/.bash_history")

check() {
  local pat="$1"
  shift
  for f in "$@"; do
    [ -f "$f" ] || continue
    if grep -EIqs "$pat" "$f"; then
      return 0
    fi
  done
  return 1
}

# Patterns (ERE) robustes, évitent les faux positifs
# 1) systemctl get-default
P_GETDEFAULT='(^|[[:space:];|&])systemctl[[:space:]]+get-default([[:space:];|&]|$)'

# 2) ps aux ... grep -E 'Xorg|wayland|gdm|sddm' (variante avec ou sans --color / guillemets)
P_PS_GREP="(^|[[:space:];|&])ps[[:space:]]+aux.*grep[[:space:]]+-E[[:space:]]*['\"]?(Xorg|wayland|gdm|sddm)['\"]?.*([[:space:];|&]|$)"

# 3) cat /etc/X11/default-display-manager (on tolère la redirection 2>/dev/null et le OR echo)
P_CAT_DM='(^|[[:space:];|&])cat[[:space:]]+/etc/X11/default-display-manager([[:space:]]|$)'

check "$P_GETDEFAULT" "${FILES[@]}" || exit 1
check "$P_PS_GREP"    "${FILES[@]}" || exit 1
check "$P_CAT_DM"     "${FILES[@]}" || exit 1

echo -n "done"

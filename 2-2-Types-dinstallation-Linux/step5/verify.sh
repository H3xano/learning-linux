#!/bin/bash
# Step5 - verify.sh (minimal & tolerant)
# Success => print only "done" and exit 0. Any other output => failure.

set -e

H1=$(eval echo "${HISTFILE:-$HOME/.bash_history}")
FILES=("$H1" "/home/learner/.bash_history" "/root/.bash_history")

check() {
  local pat="$1"; shift
  for f in "$@"; do
    [ -f "$f" ] || continue
    # -E: ERE, -I: ignore binary, -q: quiet, -s: suppress errors, -i: case-insensitive
    if grep -EIQs "$pat" "$f"; then
      return 0
    fi
  done
  return 1
}

# Essentials (very loose patterns):

# 1) Header line with "Résumé"
P_HDR='(^|[[:space:];|&])echo[[:space:]]+.*R(é|e)?sum(é|e)?.*([[:space:];|&]|$)'

# 2) "Utilisateur" echo that includes whoami on the same line
P_USER='(^|[[:space:];|&])echo[[:space:]]+.*Utilisateur.*whoami.*([[:space:];|&]|$)'

# 3) "Système" echo that includes lsb_release on the same line
P_SYS='(^|[[:space:];|&])echo[[:space:]]+.*Syst(è|e)?me.*lsb_release.*([[:space:];|&]|$)'

# 4) hostnamectl piped to grep -E with Virtualization OR Operating System (quotes optional)
P_HOST_GREP='(^|[[:space:];|&])hostnamectl.*\|.*grep[[:space:]]+-E[[:space:]]*("|\x27)?(.*Virtualization.*|.*Operating[[:space:]]+System.*)("|\x27)?([[:space:];|&]|$)'

check "$P_HDR"       "${FILES[@]}" || exit 1
check "$P_USER"      "${FILES[@]}" || exit 1
check "$P_SYS"       "${FILES[@]}" || exit 1
check "$P_HOST_GREP" "${FILES[@]}" || exit 1

echo -n "done"

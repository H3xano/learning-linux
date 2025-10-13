#!/bin/bash
# Step5 - verify.sh
# Must print only "done" on success and exit 0. Any other output = failure.

set -e

H1=$(eval echo "${HISTFILE:-$HOME/.bash_history}")
FILES=("$H1" "/home/learner/.bash_history" "/root/.bash_history")

check() {
  local pat="$1"; shift
  for f in "$@"; do
    [ -f "$f" ] || continue
    if grep -EIqs "$pat" "$f"; then
      return 0
    fi
  done
  return 1
}

# 1) echo header (on matche "Résumé" et "environnement" pour rester souple)
P_HDR='(^|[[:space:];|&])echo[[:space:]]+.*R[ée]sum[ée].*environnement.*([[:space:];|&]|$)'

# 2) echo Utilisateur : $(whoami)
P_USER='(^|[[:space:];|&])echo[[:space:]]+.*Utilisateur[[:space:]]*:[[:space:]]*\$\([[:space:]]*whoami[[:space:]]*\)([[:space:];|&]|$)'

# 3) echo Système : $(lsb_release -ds ...)
P_SYS='(^|[[:space:];|&])echo[[:space:]]+.*Syst[èe]me[[:space:]]*:[[:space:]]*\$\([[:space:]]*lsb_release[[:space:]]+-ds([^)]*)\)([[:space:];|&]|$)'

# 4) hostnamectl | grep -E 'Virtualization|Operating System' [|| echo ...]
P_HOST_GREP='(^|[[:space:];|&])hostnamectl([[:space:]]*\|[[:space:]]*grep[[:space:]]+-E[[:space:]]*['"'"'"]?Virtualization\|Operating[[:space:]]+System['"'"'"]?)([[:space:]]*\|\|[[:space:]]*echo[[:space:]]*["'"'"'][^"'"'"']*["'"'"'])?([[:space:];|&]|$)'

check "$P_HDR"       "${FILES[@]}" || exit 1
check "$P_USER"      "${FILES[@]}" || exit 1
check "$P_SYS"       "${FILES[@]}" || exit 1
check "$P_HOST_GREP" "${FILES[@]}" || exit 1

echo -n "done"

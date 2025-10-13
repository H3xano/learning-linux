#!/bin/bash
# Step3 - verify.sh
# Must print only "done" on success and exit 0. Any other output = failure.

set -e

# Récupère des fichiers d'historique plausibles
H1=$(eval echo "${HISTFILE:-$HOME/.bash_history}")
FILES=("$H1" "/home/learner/.bash_history" "/root/.bash_history")

check() {
  local pat="$1"
  shift
  for f in "$@"; do
    [ -f "$f" ] || continue
    # -E: ERE, -I: ignore binary, -q: quiet, -s: suppress errors
    if grep -EIqs "$pat" "$f"; then
      return 0
    fi
  done
  return 1
}

# 1) uptime (commande seule, tolère séparateurs/espaces)
P_UPTIME='(^|[[:space:];|&])uptime([[:space:];|&]|$)'

# 2) who (commande seule)
P_WHO='(^|[[:space:];|&])who([[:space:];|&]|$)'

# 3) systemctl list-units --type=service [--state=running] [| head -n 10]
# - tolère "-t service" ou "--type=service"
# - tolère présence/absence de "--state=running"
# - tolère pipe vers head
P_SYSTEMCTL='(^|[[:space:];|&])systemctl[[:space:]]+list-units([[:space:]]+(--type=service|-t[[:space:]]*service)){1}([[:space:]]+--state=running)?([[:space:]]*\|[[:space:]]*head([[:space:]]+-n[[:space:]]*10)?)?([[:space:];|&]|$)'

# 4) ss -tuln [| head -n 10]
# - accepte "-tuln" ou combinaisons qui contiennent t,u,l,n (ex: -tunlp)
#   on matche 'ss' puis une option qui inclut t,u,l,n dans cet ordre (peut avoir d'autres lettres entre)
P_SS='(^|[[:space:];|&])ss[[:space:]]+-[[:alnum:]]*t[[:alnum:]]*u[[:alnum:]]*l[[:alnum:]]*n[[:alnum:]]*([[:space:]]*\|[[:space:]]*head([[:space:]]+-n[[:space:]]*10)?)?([[:space:];|&]|$)'

check "$P_UPTIME"   "${FILES[@]}" || exit 1
check "$P_WHO"      "${FILES[@]}" || exit 1
check "$P_SYSTEMCTL" "${FILES[@]}" || exit 1
check "$P_SS"       "${FILES[@]}" || exit 1

echo -n "done"

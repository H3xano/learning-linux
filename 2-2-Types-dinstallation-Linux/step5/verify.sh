#!/bin/bash
# Step5 - verify.sh (robuste)
# Must print only "done" on success and exit 0. Any other output = failure.

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

# 1) echo "=== Résumé de mon environnement ==="
#    (on matche explicitement le texte du header pour éviter les faux positifs)
P_HDR='(^|[[:space:];|&])echo[[:space:]]+"===[[:space:]]*R(é|e)sum(é|e)[[:space:]]+de[[:space:]]+mon[[:space:]]+environnement[[:space:]]*==="?([[:space:];|&]|$)'

# 2) echo "Utilisateur : $(whoami)"
#    - tolère espaces autour de $( ... )
P_USER='(^|[[:space:];|&])echo[[:space:]]+("|\x27).*Utilisateur[[:space:]]*:[[:space:]]*\$\([[:space:]]*whoami[[:space:]]*\)("|\x27)([[:space:];|&]|$)'

# 3) echo "Système : $(lsb_release -ds ...)"
#    - accepte -ds, -d, -a à l'intérieur du $(), plus redirections et || echo 'Inconnu'
P_SYS='(^|[[:space:];|&])echo[[:space:]]+("|\x27).*Syst(è|e)me[[:space:]]*:[[:space:]]*\$\([[:space:]]*lsb_release[[:space:]]+(-ds|-d|-a)[^)]*\)\s*("|\x27)([[:space:];|&]|$)'

# 4) hostnamectl | grep -E 'Virtualization|Operating System' [|| echo ...]
#    - accepte guillemets simples ou doubles
#    - accepte 'Virtualization|Operating System' OU 'Virtualization\|Operating System'
#    - accepte || echo "Infos non détectées"
P_HOST_GREP='(^|[[:space:];|&])hostnamectl[[:space:]]*\|[[:space:]]*grep[[:space:]]+-E[[:space:]]*("|\x27).*(Virtualization(\||\\\|)[[:space:]]*Operating[[:space:]]+System|Operating[[:space:]]+System(\||\\\|)[[:space:]]*Virtualization).*("|\x27)([[:space:]]*\|\|[[:space:]]*echo[[:space:]]*("|\x27)[^"'"'"']*("|\x27))?([[:space:];|&]|$)'

check "$P_HDR"       "${FILES[@]}" || exit 1
check "$P_USER"      "${FILES[@]}" || exit 1
check "$P_SYS"       "${FILES[@]}" || exit 1
check "$P_HOST_GREP" "${FILES[@]}" || exit 1

echo -n "done"

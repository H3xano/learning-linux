#!/bin/bash
# Step4 - verify.sh
# Must print only "done" on success and exit 0. Any other output = failure.

set -e

# Historiques plausibles
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

# 1) lscpu | grep -i hypervisor [|| echo ...]
#    - tolère guillemets simples/doubles, espaces variables et fallback "|| echo ..."
P_LSCPU_HYP='(^|[[:space:];|&])lscpu([[:space:]]*\|[[:space:]]*grep[[:space:]]+-i[[:space:]]*['"'"'"]?hypervisor['"'"'"]?)([[:space:]]*\|\|[[:space:]]*echo[[:space:]]*["'"'"'][^"'"'"']*["'"'"'])?([[:space:];|&]|$)'

# 2) dmesg | grep -i virtual [| head -n 10] [|| true]
P_DMESG_VIRT='(^|[[:space:];|&])dmesg([[:space:]]*\|[[:space:]]*grep[[:space:]]+-i[[:space:]]*virtual)([[:space:]]*\|[[:space:]]*head([[:space:]]+-n[[:space:]]*10)?)?([[:space:]]*\|\|[[:space:]]*true)?([[:space:];|&]|$)'

# 3) lsmod | grep -i virt [|| true]
P_LSMOD_VIRT='(^|[[:space:];|&])lsmod([[:space:]]*\|[[:space:]]*grep[[:space:]]+-i[[:space:]]*virt)([[:space:]]*\|\|[[:space:]]*true)?([[:space:];|&]|$)'

check "$P_LSCPU_HYP"  "${FILES[@]}" || exit 1
check "$P_DMESG_VIRT" "${FILES[@]}" || exit 1
check "$P_LSMOD_VIRT" "${FILES[@]}" || exit 1

echo -n "done"

#!/usr/bin/env bash
set -euo pipefail

# --- Ensure user 'learner' exists ---
if ! id learner &>/dev/null; then
  useradd -m -s /bin/bash learner
  echo "learner ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/learner
  chmod 440 /etc/sudoers.d/learner
fi
# --- Prepare banner script ---
cat << 'EOF' > /tmp/banner.sh
#!/usr/bin/env bash

# Couleurs (fallback si tput absent)
if command -v tput >/dev/null 2>&1; then
  COLS="$(tput cols || echo 80)"
  BOLD="$(tput bold || true)"
  DIM="$(tput dim || true)"
  RESET="$(tput sgr0 || true)"
  CYAN="$(tput setaf 6 || true)"
  YELLOW="$(tput setaf 3 || true)"
  GREEN="$(tput setaf 2 || true)"
else
  COLS=80
  BOLD=""; DIM=""; RESET=""
  CYAN=""; YELLOW=""; GREEN=""
fi

# Centrage de texte simple
pad() {
  local text="$1" len=${#1} w=$COLS
  if [ "$len" -ge "$w" ]; then
    echo "$text"
  else
    local left=$(( (w - len) / 2 ))
    printf "%*s%s\n" "$left" "" "$text"
  fi
}

# Ligne décorative
line() {
  local ch="${1:-═}"
  printf '%*s\n' "$COLS" '' | tr ' ' "$ch"
}

clear

# Banner Formip
TITLE="Formip - La voie Express vers la Certification"
SUB="Bienvenue sur votre environnement Linux d'apprentissage"

echo
echo -e "${CYAN}$(line)${RESET}"
pad "${BOLD}${TITLE}${RESET}"
pad "${DIM}${SUB}${RESET}"
echo -e "${CYAN}$(line)${RESET}"
echo
pad "${YELLOW}Astuce :${RESET} Utilisez les flèches ↑/↓ pour retrouver vos commandes et Ctrl+L pour nettoyer l’écran."
echo
pad "${GREEN}Tapez 'help' pour commencer ou explorer l’environnement.${RESET}"
echo
EOF

chmod +x /tmp/banner.sh

# --- Real-time history for learner (critical for verify.sh) ---
# Create the file and set strict perms
touch /home/learner/.bash_history
chown learner:learner /home/learner/.bash_history
chmod 600 /home/learner/.bash_history

# Ensure history is appended & flushed each command for interactive shells
# (PROMPT_COMMAND line handles: append new lines, reload from file)
cat <<'RC' >> /home/learner/.bashrc

# --- Formip: realtime history for verification ---
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=20000
# Append to history after each command, then reload it (keeps file current)
PROMPT_COMMAND='history -a; history -c; history -r; '"$PROMPT_COMMAND"
RC
chown learner:learner /home/learner/.bashrc

# Optional: ensure root’s history also behaves (helpful if you validate as root)
if [ -f /root/.bashrc ]; then
  grep -q 'Formip: realtime history' /root/.bashrc || cat <<'RC' >> /root/.bashrc

# --- Formip: realtime history for verification ---
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=20000
PROMPT_COMMAND='history -a; history -c; history -r; '"$PROMPT_COMMAND"
RC
fi
touch /root/.bash_history || true
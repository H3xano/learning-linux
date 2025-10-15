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
  COLS=80; BOLD=""; DIM=""; RESET=""; CYAN=""; YELLOW=""; GREEN=""
fi
# Centrage de texte simple
pad() {
  local text="$1" len=${#1} w=$COLS
  if [ "$len" -ge "$w" ]; then echo "$text"; else local left=$(( (w - len) / 2 )); printf "%*s%s\n" "$left" "" "$text"; fi
}
# Ligne décorative
line() { local ch="${1:-═}"; printf '%*s\n' "$COLS" '' | tr ' ' "$ch"; }
clear
# Banner Formip
TITLE="Formip - La voie Express vers la Certification"
SUB="Bienvenue sur votre environnement Linux d'apprentissage"
echo; echo -e "${CYAN}$(line)${RESET}"; pad "${BOLD}${TITLE}${RESET}"; pad "${DIM}${SUB}${RESET}"; echo -e "${CYAN}$(line)${RESET}"; echo
pad "${YELLOW}Astuce :${RESET} Utilisez les flèches ↑/↓ pour retrouver vos commandes et Ctrl+L pour nettoyer l’écran."
echo
pad "${GREEN}Vous êtes prêt pour le Lab 3.1 : L'Art de Lire les Fichiers !${RESET}"
echo
EOF
chmod +x /tmp/banner.sh

# --- Real-time history for learner ---
touch /home/learner/.bash_history
chown learner:learner /home/learner/.bash_history
chmod 600 /home/learner/.bash_history
grep -q 'Formip: realtime history' /home/learner/.bashrc || cat <<'RC' >> /home/learner/.bashrc
# --- Formip: realtime history for verification ---
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=20000
PROMPT_COMMAND='history -a; history -c; history -r; '"$PROMPT_COMMAND"
RC
chown learner:learner /home/learner/.bashrc

# --- Tools ---
apt-get update -y >/dev/null 2>&1 || true
apt-get install -y --no-install-recommends util-linux >/dev/null 2>&1 || true


# --- AJOUT: Préparation des fichiers spécifiques au Lab 3.1 ---

# Créer un fichier simple pour cat
echo "Bonjour, explorateur Linux ! 🐧" > /home/learner/greetings.txt
echo "Ceci est un fichier texte simple." >> /home/learner/greetings.txt

# Créer un fichier plus long pour less/head/tail
echo "--- DEBUT DU LOG ---" > /home/learner/long_log.txt
for i in {1..200}; do
  echo "Ligne $i : Information de log standard." >> /home/learner/long_log.txt
done
echo "--- FIN DU LOG ---" >> /home/learner/long_log.txt

# Créer le fichier pour le flux en direct (le script foreground y écrira)
touch /home/learner/live_stream.log

# Changer le propriétaire des fichiers pour l'utilisateur du lab
chown learner:learner /home/learner/greetings.txt /home/learner/long_log.txt /home/learner/live_stream.log
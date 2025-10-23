#!/usr/bin/env bash
set -euo pipefail
if ! id learner &>/dev/null; then useradd -m -s /bin/bash learner; echo "learner ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/learner; chmod 440 /etc/sudoers.d/learner; fi
touch /home/learner/.bash_history; chown learner:learner /home/learner/.bash_history; chmod 600 /home/learner/.bash_history
grep -q 'Formip: realtime history' /home/learner/.bashrc || cat <<'RC' >> /home/learner/.bashrc
shopt -s histappend; HISTSIZE=10000; HISTFILESIZE=20000; PROMPT_COMMAND='history -a; history -c; history -r; '"$PROMPT_COMMAND"
RC
chown learner:learner /home/learner/.bashrc
cat << 'EOF' > /tmp/banner.sh
#!/usr/bin/env bash
if command -v tput >/dev/null 2>&1; then COLS="$(tput cols||echo 80)";BOLD="$(tput bold)";RESET="$(tput sgr0)";CYAN="$(tput setaf 6)";YELLOW="$(tput setaf 3)";GREEN="$(tput setaf 2)"; else COLS=80;BOLD="";RESET="";CYAN="";YELLOW="";GREEN=""; fi
pad() { text="$1";len=${#1};w=$COLS;left=$(((w-len)/2));printf "%*s%s\n" "$left" "" "$text"; }
line() { ch="${1:-═}";printf '%*s\n' "$COLS" ''|tr ' ' "$ch"; }
clear; TITLE="Formip - La voie Express vers la Certification"; SUB="Bienvenue sur votre environnement Linux d'apprentissage"
echo; echo -e "${CYAN}$(line)${RESET}"; pad "${BOLD}${TITLE}${RESET}"; pad "${SUB}${RESET}"; echo -e "${CYAN}$(line)${RESET}"; echo
pad "${GREEN}Vous êtes prêt pour le Lab 6.3 : Le Gardien des Accès !${RESET}"; echo
EOF
chmod +x /tmp/banner.sh
apt-get update >/dev/null && apt-get install -y acl build-essential >/dev/null

# --- Lab 6.3 Specific File Setup ---
echo '#!/bin/bash' > /home/learner/mon_script.sh
echo 'echo "Script exécuté !"' >> /home/learner/mon_script.sh
touch /home/learner/document.txt
touch /home/learner/secret.txt
mkdir /home/learner/shared_folder
mkdir /home/learner/public_space

# Set general ownership first
chown -R learner:learner /home/learner

# Set default permissions after ownership is set
chmod 644 /home/learner/mon_script.sh
chmod 644 /home/learner/document.txt
chmod 644 /home/learner/secret.txt
chmod 775 /home/learner/shared_folder
chmod 777 /home/learner/public_space

# --- CORRECTIONS APPLIQUÉES ICI ---
# 1. For SUID, create and compile a C program
cat << 'C_EOF' > /home/learner/suid_prog.c
#include <stdio.h>
#include <unistd.h>
int main() {
    printf("EUID: %d\n", geteuid());
    printf("UID: %d\n", getuid());
    return 0;
}
C_EOF
gcc /home/learner/suid_prog.c -o /home/learner/suid_prog
chmod 755 /home/learner/suid_prog
chown root:root /home/learner/suid_prog

# 2. For SGID, setup group and ownership correctly
groupadd equipe 2>/dev/null || true
usermod -aG equipe learner
chgrp equipe /home/learner/shared_folder
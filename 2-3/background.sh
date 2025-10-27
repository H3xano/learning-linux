#!/usr/bin/env bash
set -euo pipefail

# --- ENHANCEMENT: Create a 'learner' user with a password and limited initial sudo rights ---
# This makes the visudo exercise meaningful.
if ! id learner &>/dev/null; then
    useradd -m -s /bin/bash learner
    echo "learner:killercoda" | chpasswd

    # Grant learner ONLY the permissions needed to complete the lab, not full admin rights yet.
    # They can use cat, grep, and visudo. That's it.
    echo "learner ALL=(ALL) /bin/cat, /bin/grep, /usr/sbin/visudo, /usr/bin/tail, /usr/bin/ls, /usr/bin/date" > /etc/sudoers.d/learner-initial-setup
    chmod 440 /etc/sudoers.d/learner-initial-setup
fi

# --- Set a password for root for the 'su' command exercise ---
echo "root:killercoda" | chpasswd

# --- Standard history and banner setup ---
touch /home/learner/.bash_history
chown learner:learner /home/learner/.bash_history
chmod 600 /home/learner/.bash_history
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
pad "${GREEN}Vous êtes prêt pour le Lab 2.3 : Les Clés du Royaume (sudo, su & sudoers) !${RESET}"; echo
EOF
chmod +x /tmp/banner.sh
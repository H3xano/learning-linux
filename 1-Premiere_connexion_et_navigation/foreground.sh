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

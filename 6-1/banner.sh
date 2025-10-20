#!/usr/bin/env bash

# --- Configuration des couleurs et fonctions ---
if command -v tput >/dev/null 2>&1; then
    COLS="$(tput cols || echo 80)"
    BOLD="$(tput bold || true)"
    RESET="$(tput sgr0 || true)"
    CYAN="$(tput setaf 6 || true)"
    YELLOW="$(tput setaf 3 || true)"
    GREEN="$(tput setaf 2 || true)"
else
    COLS=80; BOLD=""; RESET=""; CYAN=""; YELLOW=""; GREEN=""
fi

pad() {
    local text="$1" len=${#1} w=$COLS
    if [ "$len" -ge "$w" ]; then echo "$text"; else local left=$(( (w - len) / 2 )); printf "%*s%s\n" "$left" "" "$text"; fi
}

line() {
    local ch="${1:-═}"
    printf '%*s\n' "$COLS" '' | tr ' ' "$ch"
}

# --- Affichage de la bannière ---
clear
TITLE="Formip - La voie Express vers la Certification"
SUB="Bienvenue sur votre environnement Linux d'apprentissage"

echo
echo -e "${CYAN}$(line)${RESET}"
pad "${BOLD}${TITLE}${RESET}"
pad "${SUB}${RESET}"
echo -e "${CYAN}$(line)${RESET}"
echo
pad "${YELLOW}Astuce :${RESET} Utilisez les flèches ↑/↓ pour retrouver vos commandes et Ctrl+L pour nettoyer l’écran."
echo

# --- Affichage du titre du lab (personnalisé via argument) ---
if [ -n "$1" ]; then
    pad "${GREEN}Vous êtes prêt pour le Lab : ${1}${RESET}"
else
    pad "${GREEN}Environnement prêt !${RESET}"
fi
echo
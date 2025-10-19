#!/bin/bash
set -e

# --- VÉRIFICATIONS SIMPLES AVEC L'HISTORIQUE ---

# On va utiliser la commande `history` qui est toujours disponible.

# 1. Vérifie qu'une ligne de l'historique contient "find" et "secret_rapport.txt".
history | grep "find" | grep -q "secret_rapport.txt" || exit 1

# 2. Vérifie qu'une ligne de l'historique contient "find", "iname", et "rapport_final.pdf".
history | grep "find" | grep "iname" | grep -q "rapport_final.pdf" || exit 1

# 3. Vérifie qu'une ligne de l'historique contient "find", "archives", et la chaîne "*.log".
#    Le pipe | permet de s'assurer que tous les mots sont sur la même ligne.
history | grep "find" | grep "archives" | grep -q "\*.log" || exit 1

# Si toutes les vérifications passent
echo -n "done"
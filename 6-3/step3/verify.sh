#!/bin/bash
set -e

# Vérifie que le bit SUID est bien activé sur le fichier.
# La commande 'stat -c "%a"' retourne les permissions en format octal (ex: 755 ou 4755).
# On vérifie si le premier chiffre est 4 (ou plus, pour couvrir 5, 6, 7 qui sont rares).

PERMS=$(stat -c "%a" /home/learner/suid_prog)

# Le premier chiffre des permissions doit être >= 4 pour que SUID soit actif (4xxx)
# On utilise l'arithmétique du shell pour comparer.
if [ ${PERMS:0:1} -ge 4 ]; then
  echo -n "done"
else
  # Le bit SUID n'a pas été appliqué.
  exit 1
fi
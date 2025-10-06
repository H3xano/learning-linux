#!/usr/bin/env bash
set -e

# Vérification des commandes exécutées
# On suppose que l'apprenant a tapé les commandes dans le terminal.

# Étape 1 : Vérifier que `whoami` a été exécuté au moins une fois
if ! history | grep -q "whoami"; then
  echo "❌ Vous n'avez pas encore exécuté la commande 'whoami'. Essayez-la pour afficher votre nom d'utilisateur."
  exit 1
fi

# Étape 2 : Vérifier que `id` a été exécuté
if ! history | grep -q "id"; then
  echo "❌ Vous n'avez pas encore exécuté la commande 'id'. Lancez-la pour voir vos UID, GID et groupes."
  exit 1
fi

# Étape 3 : Vérifier que `groups` a été exécuté
if ! history | grep -q "groups"; then
  echo "❌ Vous n'avez pas encore exécuté la commande 'groups'. Tapez-la pour afficher vos groupes d'appartenance."
  exit 1
fi

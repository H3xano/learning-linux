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

# Vérification du résultat attendu minimal (sortie de whoami)
USER_OUTPUT=$(whoami)
if [ -z "$USER_OUTPUT" ]; then
  echo "❌ La commande 'whoami' n’a rien renvoyé. Réessayez."
  exit 1
fi

# Vérification que la sortie de id contient uid/gid
if ! id | grep -q "uid="; then
  echo "❌ La commande 'id' ne semble pas avoir été exécutée correctement."
  exit 1
fi

# Vérification que groups affiche quelque chose
if [ -z "$(groups)" ]; then
  echo "❌ La commande 'groups' n’a renvoyé aucun groupe. Essayez de la relancer."
  exit 1
fi

# Si tout est bon
echo "✅ Excellent ! Vous avez découvert votre identité Linux."
echo "Vous savez maintenant qui vous êtes, vos numéros d'identité et vos groupes d'appartenance. 🎉"
exit 0

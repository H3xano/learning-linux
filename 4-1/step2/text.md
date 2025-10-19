# Étape 2 : Les territoires des utilisateurs - /home, /root, /tmp

Maintenant, voyons où les "habitants" de notre système vivent et travaillent.

### `/home` : Les appartements personnels

Chaque utilisateur normal a son propre dossier dans `/home`. C'est son espace privé. Voyons qui habite sur ce système :

`ls /home`{{execute}}

Notre utilisateur s'appelle `learner`. Le raccourci pour accéder à son propre dossier `home` est le tilde `~`. Utilisons-le pour voir le contenu de notre répertoire personnel.

`ls ~`{{execute}}

### `/root` : L'appartement du "super-héros"

L'utilisateur `root` (le super-administrateur) a un `home` spécial et séparé pour des raisons de sécurité. Il se trouve à la racine.

Essayons de regarder à l'intérieur (cela devrait échouer, car nous ne sommes pas `root`).

`ls /root`{{execute}}

Cette permission refusée est une bonne chose ! Elle protège le système.

### `/tmp` : L'espace de travail partagé et temporaire

Le dossier `/tmp` est un espace où n'importe quel utilisateur peut écrire des fichiers temporaires. Ces fichiers sont **supprimés à chaque redémarrage**.

Créons un fichier temporaire pour voir.

`touch /tmp/mon_fichier_test.txt`{{execute}}

Vérifions qu'il a bien été créé.

`ls /tmp/mon_fichier_test.txt`{{execute}}
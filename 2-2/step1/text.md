Une commande Linux est une phrase structurée : `commande [options] [arguments]`.
-   **Commande** : Le verbe (l'action). Ex: `ls`.
-   **Options** : Les adverbes (comment faire). Ex: `-l` (en format long).
-   **Arguments** : Le complément (sur quoi agir). Ex: `/etc`.

Exécutons une commande complète.

`ls -l /etc`{{execute}}

---
### Options Courtes, Longues et Combinées

Les options courtes (`-l`, `-a`) peuvent être combinées pour plus d'efficacité. Pour un affichage long (`l`), incluant les fichiers cachés (`a`) et avec des tailles lisibles (`h`), essayez :

`ls -lah ~`{{execute}}

Les options longues (`--all`, `--human-readable`) sont plus claires, surtout dans les scripts. Elles ne se combinent pas.

`ls --all --human-readable ~`{{execute}}

---
### La Complétion (`Tab`) et l'Aide (`--help`, `man`)

Votre meilleur ami est la touche `Tab`. Elle complète automatiquement les commandes et les fichiers.

Tapez `ls /et` puis appuyez sur `Tab`. Magique ! Maintenant, tapez `syst` et appuyez deux fois sur `Tab`.

`syst`{{execute T1}}

Pour une aide rapide, utilisez `--help`.

`ls --help | head -n 20`{{execute T2}}

Pour le manuel complet et détaillé, utilisez `man`. C'est la source de vérité !

`man ls`{{execute T2}}

*(Appuyez sur la touche `q` pour quitter la page du manuel.)*
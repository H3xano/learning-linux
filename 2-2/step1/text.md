Une commande Linux est une phrase structurée : `commande [options] [arguments]`.
-   **Commande** : Le verbe (l'action). Ex: `ls`.
-   **Options** : Les adverbes (comment faire). Ex: `-l` (en format long).
-   **Arguments** : Le complément (sur quoi agir). Ex: `/etc`.

Exécutons une commande complète.

`ls -l /etc`{{execute}}

---
### La Complétion Automatique (`Tab`)

Votre meilleur ami dans le terminal est la touche `Tab`. Elle complète automatiquement les noms de commandes, de fichiers et de dossiers.

Tapez `ls /et` puis appuyez sur `Tab`. Le shell complète en `ls /etc/`. Magique !

Maintenant, tapez `syst` et appuyez deux fois sur `Tab`.

`syst`{{execute T1}}

Le shell vous montre toutes les commandes qui commencent par `syst`. C'est un outil d'exploration indispensable.

Enfin, découvrons l'aide intégrée avec `--help`.

`ls --help`{{execute T2}}

Vous avez un résumé de toutes les options possibles. N'oubliez jamais `--help` !
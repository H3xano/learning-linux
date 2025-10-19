# Étape 3 : `df` et `du` - Les comptables de l'espace disque

"Disque plein !" est une alerte que tout admin redoute. `df` et `du` sont les deux outils pour diagnostiquer et résoudre ce problème.

### `df` : Le bilan global

`df` (**d**isk **f**ree) vous donne une vue d'ensemble de l'espace utilisé sur toutes vos partitions. L'option `-h` (human-readable) est indispensable.

`df -h`{{execute}}

Cette commande vous dit instantanément quelle partition est presque pleine (regardez la colonne `Use%`).

### `du` : L'audit détaillé

Une fois que vous savez *quelle* partition est pleine (par exemple, la racine `/`), `du` (**d**isk **u**sage) vous aide à trouver *quel* dossier est le coupable.

Utilisons `du` pour trouver les dossiers les plus volumineux dans `/var`.
-   `-h` : Taille humainement lisible.
-   `--max-depth=1` : Ne descend pas dans les sous-dossiers.
-   `| sort -rh` : Trie le résultat par taille, du plus grand au plus petit.

`du -h --max-depth=1 /var | sort -rh | head -n 5`{{execute}}

En une seule commande, vous avez identifié les 5 plus gros consommateurs d'espace dans `/var`. Le dossier `/var/log` est souvent un bon candidat !
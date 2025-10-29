Sur un serveur, vous n'êtes souvent pas seul. Il est crucial de savoir qui d'autre est connecté.

### `who` et `users` : Qui est là maintenant ?

La commande `who` vous donne une liste simple des utilisateurs connectés, avec des détails sur leur connexion.

`sudo who`{{execute}}

Pour une vue encore plus rapide, la commande `users` affiche uniquement les noms des utilisateurs connectés.

`sudo users`{{execute}}

Remarquez la différence : `who` donne des détails, `users` est juste une liste de noms.

---

### `w` : Qui fait quoi ?

La commande `w` est plus puissante : elle vous dit **qui** est là ET **ce qu'il fait**.

`w`{{execute}}

La colonne `WHAT` vous montre la dernière commande exécutée. La ligne du haut vous donne des infos sur le système : `load average` indique la charge du serveur.

---

### `last` : L'historique des connexions

Pour savoir qui s'est connecté **dans le passé**, on utilise `last`. C'est un outil d'audit et de sécurité essentiel.

`last`{{execute}}

`last` vous montre un historique complet, du plus récent au plus ancien. Pour voir uniquement les 5 dernières connexions, combinez `last` avec `head`.

`last | head -n 5`{{execute}}
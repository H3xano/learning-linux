Le shell peut prendre des décisions basées sur le succès ou l'échec d'une commande.

### `&&` : L'opérateur "ET" logique

`commande1 && commande2` : `commande2` ne s'exécute **que si** `commande1` réussit.

Créons un dossier `backup` et, **seulement si la création réussit**, copions nos fichiers dedans.

`mkdir backup && cp *.txt backup/`{{execute}}

Comme `mkdir backup` a réussi, la copie a eu lieu. Vérifions.

`ls backup/`{{execute}}

---
### `||` : L'opérateur "OU" logique

`commande1 || commande2` : `commande2` ne s'exécute **que si** `commande1` échoue. C'est le "plan B".

Essayons de créer un dossier qui existe déjà. Cela va échouer, ce qui déclenchera la commande suivante.

`mkdir backup || echo "Le dossier 'backup' existe déjà !"`{{execute}}

La première commande a échoué, donc le message d'erreur personnalisé s'est affiché. C'est une excellente façon de gérer les erreurs proprement.
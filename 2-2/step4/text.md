Le shell peut prendre des décisions basées sur le succès ou l'échec d'une commande.

### `&&` : L'opérateur "ET" logique
`commande1 && commande2` : `commande2` ne s'exécute **que si** `commande1` réussit.

Créons un dossier `backup` et, **seulement si la création réussit**, copions nos fichiers dedans.

`mkdir backup && cp *.txt backup/`{{execute}}
`ls backup/`{{execute}}

---
### `||` : L'opérateur "OU" logique
`commande1 || commande2` : `commande2` ne s'exécute **que si** `commande1` échoue. C'est le "plan B".

Essayons de recréer le dossier. La commande échoue, déclenchant le `echo` :

`mkdir backup || echo "Le dossier 'backup' existe déjà !"`{{execute}}

---
### `;` : L'Exécuteur Séquentiel
Et si vous voulez juste exécuter plusieurs commandes à la suite, peu importe le résultat ? Utilisez le point-virgule.

`date ; whoami ; hostname`{{execute}}
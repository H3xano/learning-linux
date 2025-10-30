Changer le propriétaire d'un fichier est une opération si puissante que seul `root` (l'administrateur) peut le faire. La commande est `chown` (**ch**ange **own**er).

### Tentative sans super-pouvoirs

Regardons le propriétaire actuel de `rapport.txt`. Il appartient à `learner`. Essayons de le transférer à `root` en tant que simple utilisateur.

`chown root rapport.txt`{{execute}}

Comme prévu, vous obtenez une erreur `Operation not permitted`. C'est une sécurité fondamentale de Linux !

### La bonne méthode : `sudo`

Nous devons donc utiliser `sudo` pour demander au système d'exécuter la commande en tant que `root`.

`sudo chown root rapport.txt`{{execute}}

Maintenant, revérifions le propriétaire.

`ls -l rapport.txt`{{execute}}

Le propriétaire est maintenant `root` !

---
### Changer le propriétaire ET le groupe

`chown` peut aussi changer le groupe en même temps avec la syntaxe `utilisateur:groupe`.

Transférons maintenant notre fichier à l'utilisateur `testuser` et au groupe `equipe`.

`sudo chown testuser:equipe rapport.txt`{{execute}}

Vérifions le résultat final.

`ls -l rapport.txt`{{execute}}

Propriétaire et groupe ont été modifiés en une seule commande.
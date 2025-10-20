Changer le propriétaire d'un fichier est une opération si puissante que seul `root` (l'administrateur) peut le faire. Nous devrons donc utiliser `sudo`.

La commande est `chown` (**ch**ange **own**er).

Regardons le propriétaire actuel de `rapport.txt`.

`ls -l rapport.txt`{{execute}}

Il appartient à `learner`. Transférons-le à l'utilisateur `root`.

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
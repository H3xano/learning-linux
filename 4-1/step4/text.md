Vous avez vu qu'il y a des exécutables dans `/bin`, `/usr/bin`, etc. Comment le shell sait-il où chercher quand vous tapez une commande comme `ls` ?

La réponse est la variable d'environnement `$PATH`. C'est une liste de dossiers, séparés par `:`, où le système cherche les commandes.

Affichons notre `$PATH` :

`echo $PATH`{{execute}}

### Démontrer la hiérarchie

Le `$PATH` a un ordre de priorité. Les dossiers listés au début sont vérifiés en premier. Le dossier `/usr/local/bin` est l'endroit parfait pour un admin qui veut ajouter une commande accessible à tous les utilisateurs sur la machine.

Créons notre propre commande "bonjour" et plaçons-la dans ce dossier.

`echo '#!/bin/bash' | sudo tee /usr/local/bin/bonjour`{{execute}}
`echo 'echo "Salut depuis /usr/local/bin !"' | sudo tee -a /usr/local/bin/bonjour`{{execute}}
`sudo chmod +x /usr/local/bin/bonjour`{{execute}}

Maintenant, la magie opère. Exécutez votre nouvelle commande depuis n'importe où :

`bonjour`{{execute}}

Ça fonctionne ! Le shell a parcouru le `$PATH`, a trouvé votre script dans `/usr/local/bin` et l'a exécuté.

### `which` : L'outil du détective

La commande `which` vous dit exactement quel exécutable sera lancé en se basant sur le `$PATH`. Vérifions pour notre commande :

`which bonjour`{{execute}}

Et pour la commande `ls` ?

`which ls`{{execute}}

Grâce au `$PATH`, vous n'avez pas besoin de taper `/usr/local/bin/bonjour` ou `/bin/ls` à chaque fois. Vous tapez juste le nom, et le système le trouve pour vous. C'est cette hiérarchie bien pensée qui rend Linux si puissant et organisé !
Vous avez vu qu'il y a des exécutables dans `/bin`, `/usr/bin`, etc. Comment le shell sait-il où chercher quand vous tapez une commande comme `ls` ?

La réponse est la variable d'environnement `$PATH`. C'est une liste de dossiers, séparés par `:`, où le système cherche les commandes.

Affichons notre `$PATH` :

`echo $PATH`{{execute}}

Le shell va chercher dans le premier dossier de la liste, puis le deuxième, et ainsi de suite, jusqu'à ce qu'il trouve la commande.

### `which` : L'outil du détective

La commande `which` vous dit exactement quel exécutable sera lancé en se basant sur le `$PATH`.

Où se trouve la commande `ls` ?

`which ls`{{execute}}

Où se trouve la commande `nano` ?

`which nano`{{execute}}

Grâce au `$PATH`, vous n'avez pas besoin de taper `/bin/ls` à chaque fois. Vous tapez `ls`, et le système le trouve pour vous. C'est cette hiérarchie bien pensée qui rend Linux si puissant et organisé !
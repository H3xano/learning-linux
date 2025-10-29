C'est frustrant de devoir taper `./` tout le temps. Et si on pouvait lancer `mon_script.sh` de n'importe où, comme on le fait pour `ls` ? Pour cela, il faut le placer dans un dossier qui est dans le `$PATH`.

Créons notre propre dossier pour nos commandes personnelles. La convention est de le nommer `bin` (pour binaires) dans notre `home`.

`mkdir ~/bin`{{execute}}

Maintenant, déplaçons notre script dans ce nouveau dossier.

`mv ~/mon_script.sh ~/bin/`{{execute}}

Il ne reste plus qu'une étape : dire au shell de chercher aussi les commandes dans `~/bin`. Nous allons ajouter ce dossier au **début** de notre `$PATH` pour qu'il soit prioritaire.

`export PATH=~/bin:$PATH`{{execute}}

Vérifions que le PATH a bien été mis à jour. Votre nouveau dossier doit apparaître en premier.

`echo $PATH`{{execute}}

Le grand final ! Retournez dans n'importe quel dossier (par exemple votre `home`) et essayez de lancer le script **sans** `./`.

`cd ~`{{execute}}
`mon_script.sh`{{execute}}

**Victoire !** Vous venez de rendre une commande personnelle disponible dans tout le système pour votre session. C'est une compétence fondamentale d'administrateur Linux.
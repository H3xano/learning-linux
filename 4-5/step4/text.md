# Étape 4 : `which` et `whereis` - Retrouver ses commandes

Comment savoir où est installée une commande comme `ls` ou `python3` ?

### `which` : Quelle commande est exécutée ?

`which` vous donne le chemin exact de la commande qui sera exécutée en se basant sur votre `$PATH`. C'est l'outil parfait pour savoir "quelle version de l'outil j'utilise ?".

`which ls`{{execute}}

`which python3`{{execute}}

### `whereis` : La vue d'ensemble

`whereis` est plus complet. Il ne vous donne pas seulement le chemin de la commande, mais aussi l'emplacement de sa page de manuel (`man`) et de son code source s'ils sont disponibles.

`whereis ls`{{execute}}

Vous voyez le binaire (`/bin/ls`) et sa page de manuel.

`whereis python3`{{execute}}

`whereis` vous donne une carte complète de tous les fichiers importants liés à une commande. C'est très utile pour comprendre comment un programme est installé sur le système.
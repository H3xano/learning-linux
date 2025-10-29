Où sont installés les logiciels et où sont stockées les données qui changent tout le temps (comme les logs) ?

### `/usr` : Le "centre commercial" des applications

La majorité des programmes que vous installez via votre gestionnaire de paquets (comme `apt`) se retrouvent dans `/usr` (User System Resources). C'est un dossier immense.

Regardons juste où se trouve la commande `python3` :

`which python3`{{execute}}

Comme vous le voyez, elle est dans `/usr/bin`.

### `/var` : L'entrepôt dynamique

Le dossier `/var` (variable) est crucial. Il contient toutes les données qui **changent constamment**. La partie la plus importante est `/var/log`, où sont stockés tous les journaux d'événements (les logs).

Listons le contenu du dossier des logs :

`ls /var/log`{{execute}}

On y trouve des logs pour le système (`syslog`), pour l'authentification (`auth.log`), etc. C'est le premier endroit où un admin regarde quand quelque chose ne va pas.

Mais `/var` ne contient pas que des logs ! Il gère aussi le **cache** des applications. Par exemple, le cache de l'outil `apt` :

`ls /var/cache/apt/`{{execute}}

### `/opt` et `/srv` : Les zones spécialisées

Le dossier `/opt` (optional) est utilisé pour les logiciels installés manuellement (comme Google Chrome, Zoom...). Sur cet environnement, il est probablement vide.

`ls /opt`{{execute}}

Enfin, le dossier `/srv` (service) est destiné à contenir les données servies par le système, comme les fichiers d'un site web. Il est souvent vide par défaut.

`ls /srv`{{execute}}
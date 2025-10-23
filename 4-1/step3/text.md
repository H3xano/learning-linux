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

### `/opt` : Les boutiques indépendantes

Le dossier `/opt` (optional) est utilisé pour les logiciels installés manuellement, souvent par des éditeurs tiers (comme Google Chrome, Zoom, etc.). Sur cet environnement de base, il est probablement vide.

`ls /opt`{{execute}}
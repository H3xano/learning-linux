Commençons par les "organes vitaux" de Linux. Ces dossiers contiennent tout ce qui est essentiel pour que le système démarre et fonctionne.

### `/bin` : La boîte à outils de base

Le dossier `/bin` (binaries) contient les commandes de base que tout utilisateur peut utiliser. Explorons son contenu avec `ls`.

`ls /bin`{{execute}}

Vous reconnaissez des commandes comme `cat`, `cp`, `ls`, `mv`, `rm`... Sans ce dossier, le système serait inutilisable !

### `/sbin` : La boîte à outils de l'admin

Le dossier `/sbin` (system binaries) contient des commandes réservées à l'administrateur (`root`) pour la maintenance du système.

`ls /sbin`{{execute}}

Vous y voyez des commandes comme `fdisk` (gestion des disques) ou `reboot`. C'est le centre de contrôle du système.

### `/etc` : Le cerveau du système

Le dossier `/etc` (editable text configuration) contient tous les fichiers de configuration. C'est ici que l'on modifie le comportement du système.

Listons quelques fichiers de configuration importants :

`ls /etc/hostname /etc/hosts /etc/passwd`{{execute}}

- `/etc/hostname` : contient le nom de votre machine.
- `/etc/hosts` : permet de faire correspondre des noms à des adresses IP.
- `/etc/passwd` : contient la liste des utilisateurs du système.

Visualisons le nom de notre machine :

`cat /etc/hostname`{{execute}}
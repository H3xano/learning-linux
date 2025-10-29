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

Visualisons le nom de notre machine :

`cat /etc/hostname`{{execute}}

### `/boot` : La clé de contact du système

Comme son nom l'indique, `/boot` contient les fichiers nécessaires au démarrage, notamment le noyau Linux lui-même !

`ls -lh /boot`{{execute}}

Repérez les fichiers `vmlinuz-...` : c'est le cœur battant de votre système d'exploitation.

### `/dev` : Le tableau de bord du matériel

Un concept fondamental de Linux est : "tout est un fichier". Le dossier `/dev` (devices) en est la preuve. Il contient des fichiers spéciaux qui représentent votre matériel.

Utilisons un fichier spécial très connu : `/dev/null`, le trou noir. Tout ce que vous y envoyez disparaît à jamais. C'est très pratique pour ignorer la sortie d'une commande.

`echo "Ce message va disparaître" > /dev/null`{{execute}}

La commande n'a rien affiché ! Vous venez de faire votre première interaction avec un périphérique via un simple fichier.
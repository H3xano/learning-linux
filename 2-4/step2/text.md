Les **alias** sont des raccourcis pour des commandes longues. Les **variables personnalisées** sont des raccourcis pour des chemins ou des valeurs.

### Créer son premier alias

Fatigué de taper `ls -lah` ? Créons un alias `ll` pour faire la même chose.

Ajoutons cette ligne à la fin de notre `.bashrc`. La commande `echo "..." >> ~/.bashrc` est parfaite pour ça.

`echo "alias ll='ls -lah'" >> ~/.bashrc`{{execute}}

Maintenant, rechargez la configuration pour que l'alias soit actif.

`source ~/.bashrc`{{execute}}

Testez votre nouvel alias !

`ll`{{execute}}

Magique ! `ll` est maintenant équivalent à `ls -lah`.

---
### Créer une variable pour un chemin important

Imaginons que vous travaillez souvent dans le dossier des logs système, `/var/log`. Créons une variable `$LOG_DIR` pour y accéder rapidement.

`echo 'export LOG_DIR="/var/log"' >> ~/.bashrc`{{execute}}
`source ~/.bashrc`{{execute}}

Maintenant, vous pouvez lister le contenu de ce dossier depuis n'importe où.

`ls $LOG_DIR`{{execute}}
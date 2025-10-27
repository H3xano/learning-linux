### Les Alias : Des Raccourcis Simples

Fatigué de taper `ls -lah` ? Créons un alias `ll`. La commande `echo "..." >> ~/.bashrc` est parfaite pour ajouter une ligne à la fin d'un fichier.

`echo "alias ll='ls -lah --color=auto'" >> ~/.bashrc`{{execute}}

Rechargez la configuration pour que l'alias soit actif.

`source ~/.bashrc`{{execute}}

Testez votre nouvel alias !

`ll`{{execute}}

Magique ! `ll` est maintenant votre raccourci personnel.

---
### Les Fonctions : Des Raccourcis Intelligents

Les alias sont super, mais ils ne peuvent pas gérer d'arguments. Pour cela, on utilise des **fonctions**. Créons une fonction `mkcd` qui crée un répertoire et s'y déplace en une seule commande.

`echo 'mkcd() { mkdir -p "$1" && cd "$1"; }' >> ~/.bashrc`{{execute}}

Rechargez et testez cette nouvelle commande surpuissante.

`source ~/.bashrc`{{execute}}
`mkcd mon-super-projet`{{execute}}

Vérifiez que vous êtes bien dans le nouveau dossier.

`pwd`{{execute}}

Vous venez de créer votre propre commande shell !
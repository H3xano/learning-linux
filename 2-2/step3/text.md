Les commandes communiquent via 3 "tuyaux" : **stdin** (entrée), **stdout** (sortie normale), **stderr** (sortie d'erreur).

### La Redirection de Sortie `>`
`>` redirige la sortie normale (`stdout`) vers un fichier, en l'écrasant.

`date > date.txt`{{execute}}
`cat date.txt`{{execute}}

Pour **ajouter** à la fin, utilisez `>>`.

`echo "--- Fin du fichier ---" >> date.txt`{{execute}}
`cat date.txt`{{execute}}

### La Redirection des Erreurs `2>`
Les erreurs (`stderr`) s'affichent aussi à l'écran. Pour les cacher ou les enregistrer, on les redirige avec `2>`. La destination `/dev/null` est une "poubelle" virtuelle.

Cherchons un fichier. La commande va générer des erreurs "Permission non accordée". Masquons-les pour ne voir que les résultats :

`find / -name "hosts" 2> /dev/null`{{execute}}

---
### Le Pipe `|` : Le Connecteur Magique
Le pipe `|` connecte la sortie (`stdout`) d'une commande à l'entrée (`stdin`) d'une autre.

Listons les processus et filtrons avec `grep` pour ne voir que `bash`.

`ps aux | grep "bash"`{{execute}}

Listons les fichiers de `/etc` et comptons-les avec `wc -l`.

`ls /etc | wc -l`{{execute}}

Vous avez créé une "chaîne de production" sans fichier temporaire !
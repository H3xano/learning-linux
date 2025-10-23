Les commandes communiquent via 3 "tuyaux" : **stdin** (entrée), **stdout** (sortie normale), **stderr** (sortie d'erreur).

### La Redirection de Sortie `>`

Par défaut, `stdout` va à l'écran. `>` permet de le rediriger vers un fichier.

Sauvegardons la date actuelle dans un fichier.

`date > date.txt`{{execute}}

Rien ne s'affiche ! C'est normal. Vérifions le contenu du fichier.

`cat date.txt`{{execute}}

**Attention :** `>` **écrase** le fichier. Pour **ajouter** à la fin, utilisez `>>`.

`echo "--- Fin du fichier ---" >> date.txt`{{execute}}
`cat date.txt`{{execute}}

---
### Le Pipe `|` : Le Connecteur Magique

Le pipe `|` connecte la sortie (`stdout`) d'une commande à l'entrée (`stdin`) d'une autre. C'est la base du chaînage.

Listons tous les processus et utilisons `grep` pour filtrer uniquement ceux liés au shell `bash`.

`ps aux | grep "bash"`{{execute}}

Listons les fichiers de `/etc` et comptons-les avec `wc -l`.

`ls /etc | wc -l`{{execute}}

Vous avez créé une "chaîne de production" en une seule ligne, sans créer de fichier temporaire !
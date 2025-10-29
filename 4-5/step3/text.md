Trouver des fichiers, c'est bien. Agir dessus automatiquement, c'est encore mieux ! C'est le super-pouvoir de `find`.

### Suppression sécurisée avec `-delete`

Imaginons que vous vouliez nettoyer tous les fichiers temporaires (`.tmp`). L'option `-delete` est plus sûre et plus efficace que d'utiliser `rm`.

Trouvez et supprimez tous les fichiers se terminant par `.tmp` dans le dossier `~/temporaire`.

`find ~/temporaire -name "*.tmp" -delete`{{execute}}

Vérifions que le dossier est maintenant vide :

`ls ~/temporaire`{{execute}}

Les fichiers ont disparu !

### Exécuter une commande avec `-exec`

L'option `-exec` permet de lancer n'importe quelle commande sur chaque fichier trouvé. C'est la clé de l'automatisation.

La syntaxe `{} \;` est spéciale :
-   `{}` est remplacé par le nom de chaque fichier trouvé.
-   `\;` marque la fin de la commande à exécuter.

Nous avons un vieux fichier log. Trouvons-le et compressons-le avec `gzip`.

`find ~/archives -name "vieux_log.log" -exec gzip {} \;`{{execute}}

Vérifions le résultat. Le fichier a été renommé en `.log.gz`.

`ls ~/archives`{{execute}}

Vous venez de transformer `find` d'un simple outil de recherche en un puissant robot d'automatisation !
Les liens durs sont limités (pas de dossiers, même partition). Les **liens symboliques** (`ln -s`) sont beaucoup plus flexibles. C'est un "raccourci" ou un "portail" qui pointe vers un autre fichier ou dossier.

### Créer un lien symbolique

La syntaxe est `ln -s [cible] [nom_du_lien]`.

Créons un fichier et un lien symbolique qui pointe vers lui.

`echo "Contenu de la cible" > fichier_cible.txt`{{execute}}
`ln -s fichier_cible.txt mon_raccourci`{{execute}}

Utilisons `ls -l` pour voir le résultat.

`ls -l`{{execute}}

Vous voyez plusieurs différences :
-   Le lien a son propre inode (utilisez `ls -i` pour vérifier).
-   La première lettre des permissions est un `l` (pour **l**ink).
-   Une flèche `->` indique clairement où le lien pointe.

Si vous lisez le contenu du lien, vous lisez en fait le contenu de la cible.

`cat mon_raccourci`{{execute}}
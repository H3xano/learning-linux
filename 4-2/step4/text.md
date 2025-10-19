# Étape 4 : `ln` - L'art des liens

Comment avoir un fichier à deux endroits sans le copier ? Grâce aux liens !

### Le lien symbolique (ou "symlink")

C'est un simple raccourci. Il pointe vers un autre fichier. Créons un fichier et un lien symbolique vers lui. L'option `-s` crée un lien **s**ymbolique.

`echo "Ceci est mon fichier original." > original.txt`{{execute}}
`ln -s original.txt raccourci.txt`{{execute}}

Utilisons `ls -l` pour voir ce que nous avons créé.

`ls -l original.txt raccourci.txt`{{execute}}

Regardez la première lettre : `l` pour `raccourci.txt` indique que c'est un lien. La flèche `->` vous montre où il pointe.

Si nous supprimons l'original, le lien devient "cassé".

`rm original.txt`{{execute}}
`cat raccourci.txt`{{execute}}

L'opération échoue car la cible n'existe plus.

### Le lien dur (ou "hard link")

Un lien dur est différent : c'est un deuxième nom pour le *même* contenu. Il n'y a pas d'original ou de copie, les deux noms sont égaux.

`echo "Données partagées." > data.txt`{{execute}}
`ln data.txt data_alias.txt`{{execute}}

Regardons leurs **inodes** (leur numéro d'identité unique) avec `ls -i`.

`ls -i data.txt data_alias.txt`{{execute}}

Ils ont le **même numéro d'inode** ! C'est la preuve qu'ils pointent vers les mêmes données sur le disque.

Maintenant, si on supprime un des noms, les données restent accessibles via l'autre.

`rm data.txt`{{execute}}
`cat data_alias.txt`{{execute}}

Ça marche ! Les données ne sont supprimées que lorsque le dernier nom pointant vers elles est effacé.
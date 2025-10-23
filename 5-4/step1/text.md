Chaque fichier sur Linux a un numéro d'identité secret appelé **inode**. Le nom du fichier n'est qu'une étiquette qui pointe vers cet inode.

Utilisons `ls -i` pour voir le numéro d'inode d'un fichier.

`touch mon_fichier.txt`{{execute}}
`ls -i mon_fichier.txt`{{execute}}

Le numéro affiché avant le nom est son inode.

---

### Le Lien Dur (`ln`)

Un **lien dur** est simplement une deuxième étiquette (un deuxième nom) pour le **même inode**. Il n'y a pas de copie, c'est le même fichier.

Créons un lien dur.

`ln mon_fichier.txt mon_deuxieme_nom.txt`{{execute}}

Maintenant, vérifions leurs inodes.

`ls -i mon_fichier.txt mon_deuxieme_nom.txt`{{execute}}

**Ils ont le même inode !** Ce sont deux noms pour les mêmes données. Si vous modifiez l'un, l'autre est aussi modifié. Si vous en supprimez un, les données restent accessibles via l'autre.
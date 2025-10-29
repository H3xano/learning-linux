Chaque fichier sur Linux a un numéro d'identité secret appelé **inode**. Le nom du fichier n'est qu'une étiquette qui pointe vers cet inode.

Utilisons `ls -i` pour voir le numéro d'inode d'un fichier.

`touch mon_fichier.txt`{{execute}}
`ls -i mon_fichier.txt`{{execute}}

Le numéro affiché avant le nom est son inode.

---

### Le Lien Dur (`ln`)

Un **lien dur** est simplement une deuxième étiquette (un deuxième nom) pour le **même inode**. Il n'y a pas de copie, c'est le même fichier.

`ln mon_fichier.txt mon_deuxieme_nom.txt`{{execute}}

Vérifions leurs inodes. Ils devraient être identiques.

`ls -i mon_fichier.txt mon_deuxieme_nom.txt`{{execute}}

**Ils ont le même inode !** Allons plus loin en inspectant le "compteur de liens" avec la commande `stat`.

`stat mon_fichier.txt`{{execute}}

Repérez la ligne **`Links: 2`**. Cela confirme que deux noms pointent vers cet inode.

---

### Testons les limites

Les liens durs ont des limitations. L'une d'elles est qu'ils ne peuvent pas pointer vers un répertoire. Essayez de créer un lien dur vers le dossier `data`.

`ln data lien_repertoire_impossible`{{execute}}

L'erreur que vous voyez (`hard link not allowed for directory`) est un comportement normal et attendu. Vous venez de vérifier expérimentalement une règle fondamentale des liens durs.
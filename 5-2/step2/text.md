### Contrôler l'entrée avec `<`

Avant de rediriger la sortie, voyons rapidement comment rediriger l'entrée. Le symbole `<` envoie le contenu d'un fichier dans l'entrée standard (`stdin`) d'une commande. C'est comme si vous tapiez le contenu du fichier vous-même.

Créons un fichier, puis donnons-le à `cat` en utilisant la redirection d'entrée.

`echo "Ce texte vient d'un fichier." > mon_input.txt`{{execute}}

Maintenant, `cat` va lire son entrée depuis le fichier `mon_input.txt` au lieu de votre clavier.

`cat < mon_input.txt`{{execute}}

---

### Sauvegarder la sortie avec `>`

Le symbole `>` permet de **rediriger** `stdout` (la sortie normale) vers un fichier au lieu de l'écran.

Sauvegardons la liste des fichiers de `/etc` dans un fichier nommé `liste_etc.txt`.

`ls /etc > liste_etc.txt`{{execute}}

Rien ne s'est affiché à l'écran ! C'est normal, la sortie a été détournée. Vérifions le contenu du fichier.

`cat liste_etc.txt`{{execute}}

### Attention : `>` écrase !

`>` est destructeur : il écrase le contenu du fichier s'il existe déjà.

`echo "Ce fichier sera écrasé." > liste_etc.txt`{{execute}}
`cat liste_etc.txt`{{execute}}

Toute la liste a été remplacée !

### Ajouter avec `>>`

Pour **ajouter** à la fin d'un fichier sans l'écraser, on utilise `>>`. Créons un journal.

`echo "Première entrée dans le journal." > journal.log`{{execute}}
`echo "Deuxième entrée, ajoutée à la suite." >> journal.log`{{execute}}

Vérifions que les deux lignes sont bien présentes.

`cat journal.log`{{execute}}
Commençons par la commande la plus fondamentale pour lire un fichier : `cat` (abréviation de *concatenate*).

Un script a déjà préparé quelques fichiers pour nous. Affichons le contenu d'un fichier texte simple.

`cat greetings.txt`{{execute}}

Comme vous le voyez, `cat` affiche simplement tout le contenu du fichier dans le terminal. Simple et efficace !

---

### Numéroter les lignes

Parfois, il est utile de numéroter les lignes. Pour cela, on utilise l'option `-n`.

`cat -n greetings.txt`{{execute}}

Magique ! Chaque ligne est maintenant précédée de son numéro. C'est parfait pour discuter d'un fichier avec un collègue ("regarde la ligne 2").

---

### Inspecter avant d'afficher : `file`

Sous Linux, il y a des fichiers texte (lisibles) et des fichiers binaires (des programmes, des images...). Avant d'utiliser `cat` sur un fichier dont on n'est pas sûr, la bonne pratique est d'utiliser la commande `file` pour l'inspecter.

Voyons ce que Linux pense du programme `/bin/ls` :

`file /bin/ls`{{execute}}

Le résultat est clair : `executable`, `dynamically linked`, etc. Ce n'est **pas** du "ASCII text". C'est donc un binaire !

---

### ⚠️ Attention aux fichiers binaires !

Maintenant que nous savons que c'est un binaire, voyons ce qui se passe si on ignore l'avertissement et qu'on utilise `cat` dessus.

`cat /bin/ls`{{execute}}

Du charabia, n'est-ce pas ? 😱 Pire, cela peut parfois "casser" l'affichage de votre terminal.

**Leçon de sécurité n°1 :** Toujours vérifier avec `file` avant d'utiliser `cat` sur un inconnu. Si votre terminal devient bizarre, tapez `reset` (même si vous ne voyez pas ce que vous tapez) et appuyez sur `Entrée`.

---

### Le super-pouvoir caché de `cat` : La création

`cat` n'est pas seulement un lecteur, c'est aussi un créateur ! On peut l'utiliser pour créer un fichier rapidement.

Essayez la commande suivante :
`cat > todo.txt`

Le terminal attend votre saisie. Tapez les deux lignes suivantes :
```
- Apprendre Linux
- Devenir un pro de la ligne de commande
```
Maintenant, pour sauvegarder et quitter, maintenez la touche **`Ctrl`** et appuyez sur **`D`**.

Vérifiez que votre fichier a bien été créé :
`cat todo.txt`{{execute}}

Vous venez de créer un fichier sans utiliser un éditeur de texte. C'est une technique très pratique !
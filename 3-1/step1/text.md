# Étape 1 : `cat` - L'affichage brut et puissant 🐈

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

### ⚠️ Attention aux fichiers binaires !

Sous Linux, il y a des fichiers texte (lisibles) et des fichiers binaires (des programmes, des images...). Que se passe-t-il si on utilise `cat` sur un binaire, comme le programme `/bin/ls` ? Essayons...

`cat /bin/ls`{{execute}}

Du charabia, n'est-ce pas ? 😱 Pire, cela peut parfois "casser" l'affichage de votre terminal.

**Leçon de sécurité n°1 :** N'utilisez `cat` que sur des fichiers que vous savez être du texte. Si votre terminal devient bizarre après une mauvaise manipulation, tapez `reset` (même si vous ne voyez pas ce que vous tapez) et appuyez sur `Entrée`.
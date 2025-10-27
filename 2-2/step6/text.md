Bienvenue dans la partie la plus magique du grimoire Bash ! Vous allez découvrir que le shell n'est pas qu'un simple interpréteur, c'est un véritable langage de programmation.

### La Calculatrice Intégrée `$((...))`
Le shell peut faire des maths ! La syntaxe `$((...))` permet d'effectuer des calculs arithmétiques directement en ligne de commande.

`echo "Résultat de 100 / 5 : $((100 / 5))"`{{execute}}

On peut bien sûr utiliser des variables.

`REDUCTIONS=15`{{execute}}
`PRIX_INITIAL=50`{{execute}}
`echo "Prix final : $((PRIX_INITIAL - REDUCTIONS)) €"`{{execute}}

---
### La Transformation de Texte `${...}`

La substitution de paramètres `${...}` est un outil incroyablement puissant pour manipuler des chaînes de caractères sans utiliser d'outils externes.

Par exemple, changeons l'extension d'un fichier.

`FICHIER="image.jpeg"`{{execute}}
`echo "Nouveau nom : ${FICHIER%.jpeg}.jpg"`{{execute}}

Ici, `${FICHIER%.jpeg}` signifie "prend la variable FICHIER et supprime le motif `.jpeg` à la fin".

Vous pouvez aussi extraire juste le nom du fichier d'un chemin complet :

`CHEMIN="/home/learner/projet/src/main.c"`{{execute}}
`echo "Nom du fichier : ${CHEMIN##*/}"`{{execute}}

Avec ces formules, vous pouvez automatiser des tâches complexes de renommage et de traitement de texte !
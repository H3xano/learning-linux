`grep` est un filtre. Donnez-lui un "motif" (du texte à chercher) et un fichier, et il vous montrera **uniquement les lignes qui contiennent ce motif**.

Pour nos exercices, un fichier `agents.txt` a été préparé. Commençons par l'afficher pour voir son contenu.

`cat agents.txt`{{execute}}

Maintenant, utilisons `grep` pour trouver tous les agents basés à "Paris".

`grep "Paris" agents.txt`{{execute}}

Impressionnant, non ? `grep` a instantanément filtré le fichier et n'a affiché que les lignes pertinentes.

---

### Filtrer la sortie d'une autre commande

Le vrai pouvoir de `grep` se révèle quand on le combine avec d'autres commandes via un "pipe" (`|`).

La commande `ps aux` liste tous les processus en cours sur le système, ce qui peut être très verbeux. Utilisons `grep` pour trouver uniquement les processus liés au shell `bash`.

`ps aux | grep "bash"`{{execute}}

Vous voyez deux lignes : le processus `bash` lui-même, et... le processus `grep "bash"` que vous venez de lancer ! C'est un effet de bord classique.

**Astuce de pro :** pour éliminer cette ligne parasite, on peut utiliser `grep` contre lui-même avec l'option `-v` (que nous verrons en détail à l'étape 2) pour exclure la ligne contenant `grep`. Essayez !

`ps aux | grep "bash" | grep -v "grep"`{{execute}}

Et voilà, une sortie parfaitement propre ! C'est une technique que vous verrez très souvent.
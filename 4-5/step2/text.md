# Étape 2 : `find` - La recherche par attributs

`find` peut chercher selon bien plus que le nom ! La taille et la date sont des critères très utiles.

### Recherche par taille avec `-size`

Trouvons les fichiers qui sont **plus gros que** 40 kilooctets (`+40k`) dans notre répertoire `home`.

`find ~ -size +40k`{{execute}}

Le `+` signifie "plus de". Vous pouvez utiliser `k` pour les Ko, `M` for les Mo, et `G` pour les Go.

### Recherche par date avec `-mtime`

`mtime` (**m**odification **time**) permet de chercher les fichiers modifiés récemment.
-   `-mtime -1` : modifié il y a **moins d'un** jour (récent).
-   `-mtime +1` : modifié il y a **plus d'un** jour (ancien).

Cherchons les fichiers qui ont été modifiés dans les dernières 24 heures.

`find ~ -mtime -1`{{execute}}

### Combiner les critères

La vraie puissance de `find` est de pouvoir combiner les critères. Cherchons les fichiers de **plus de 1k** ET qui ont été **modifiés récemment**.

`find ~ -size +1k -mtime -1`{{execute}}

Vous venez de réaliser une recherche complexe que `ls` ne pourrait jamais faire !
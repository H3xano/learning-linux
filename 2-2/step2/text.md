Les métacaractères (ou "wildcards") sont des jokers qui permettent de sélectionner plusieurs fichiers à la fois. Des fichiers d'exemple ont été créés pour vous.

### L'astérisque `*` : Le Joker Universel
`*` signifie "n'importe quelle suite de caractères". Listons tous les fichiers `.txt`.

`ls *.txt`{{execute}}

### Le `?` et les crochets `[]` : La Sélection Précise
-   `?` remplace **un seul** caractère.
-   `[]` remplace un caractère parmi une **liste**.

Listons les rapports avec un seul chiffre et les photos A ou B.

`ls rapport_0?.txt`{{execute}}
`ls photo[AB].jpg`{{execute}}

---
### `{}` : Le Multiplicateur de Création

L'expansion d'accolades n'est pas un joker, mais un générateur ! Il crée des chaînes de caractères avant que la commande ne s'exécute. C'est un sortilège de productivité massive.

Créez d'un coup toute la structure d'un projet :

`mkdir -v projet`{{execute}}
`mkdir -v projet/{src,doc,assets,tests}`{{execute}}

Le `-v` (verbose) vous montre la magie en action !
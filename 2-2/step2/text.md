# Étape 2 : Les Métacaractères - Cibler en Masse

Les métacaractères (ou "wildcards") sont des jokers qui permettent de sélectionner plusieurs fichiers à la fois.

Des fichiers d'exemple (`rapport_01.txt`, `rapport_02.txt`, `photoA.jpg`, `photoB.jpg`) ont été créés pour vous.

### L'astérisque `*` : Le Joker Universel

`*` signifie "n'importe quelle suite de caractères".

Listons tous les fichiers qui se terminent par `.txt`.

`ls *.txt`{{execute}}

Listons tous les fichiers qui commencent par `photo`.

`ls photo*`{{execute}}

---
### Le `?` et les crochets `[]` : La Sélection Précise

-   `?` remplace **un seul** caractère.
-   `[]` remplace un caractère parmi une **liste** ou un **intervalle**.

Listons les rapports avec un seul chiffre.

`ls rapport_0?.txt`{{execute}}

Listons les photos A ou B.

`ls photo[AB].jpg`{{execute}}
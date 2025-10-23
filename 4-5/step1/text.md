`find` est l'outil de recherche le plus puissant de Linux. Sa syntaxe de base est : `find [où_chercher] [critère] [ce_que_vous_cherchez]`.

Pour nos exercices, une arborescence de dossiers a été créée.

### Recherche exacte avec `-name`

Cherchons un fichier au nom exact de `secret_rapport.txt` en partant de notre répertoire `home` (`~`).

`find ~ -name "secret_rapport.txt"`{{execute}}

`find` a exploré tous les sous-dossiers et a trouvé le fichier ! Notez que `-name` est sensible à la casse.

### Recherche insensible à la casse avec `-iname`

Maintenant, cherchons un rapport dont on ne connaît pas la casse exacte.

`find ~ -iname "rapport_final.pdf"`{{execute}}

Le `i` dans `-iname` signifie "ignore case" et a permis de trouver `RAPPORT_FINAL.PDF`.

### Recherche avec wildcards `*`

Le `*` est un joker qui signifie "n'importe quelle suite de caractères". C'est parfait pour les recherches partielles.

Trouvons tous les fichiers qui se terminent par `.log` dans le dossier `archives/`.

`find ~/archives -name "*.log"`{{execute}}
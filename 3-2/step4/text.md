# Étape 4 : Le `grep` visuel - Couleur et Contexte 🎨

Trouver une ligne, c'est bien. La **comprendre en un clin d'œil**, c'est le niveau expert.

### `--color` : Mettre en lumière les résultats

L'option `--color` (ou `--color=auto`) surligne le motif trouvé. C'est beaucoup plus facile pour les yeux !

Cherchons les erreurs dans `app.log` avec la coloration activée.

`grep --color "ERROR" app.log`{{execute}}

Voyez comme le mot "ERROR" saute aux yeux ! La plupart des systèmes modernes ont un alias qui active cette option par défaut, car elle est tout simplement indispensable.

---

### `-C` : Afficher le contexte

Souvent, la ligne qui contient l'erreur ne suffit pas. On a besoin de savoir ce qui s'est passé **avant** et **après**. L'option `-C` (Context) est là pour ça.

Cherchons l'erreur "Connexion refusée" dans `system.log` et affichons **1 ligne de contexte** avant et après (`-C 1`).

`grep -C 1 "Connexion refusée" system.log`{{execute}}

**Révélation !** Grâce au contexte, vous voyez maintenant que l'erreur est survenue juste après une "Tentative de connexion à la base de données". Sans contexte, cette information cruciale aurait été perdue.

---

### La combinaison ultime

Combinons tout ce que nous avons appris : une recherche **récursive** (`-r`), avec **numéros de ligne** (`-n`), **insensible à la casse** (`-i`), avec **coloration** et **2 lignes de contexte** (`-C 2`).

Cherchons la mention de "projet" dans le dossier `missions/`.

`grep -rinC 2 "projet" missions/`{{execute}}

C'est ça, la puissance de `grep` : une commande, des options modulables, et une capacité d'analyse de données quasi illimitée.
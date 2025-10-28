Un détective ne se contente pas d'une seule pièce, il fouille tout le bâtiment ! `grep` peut faire de même avec les fichiers et les dossiers.

Plusieurs fichiers de logs (`system.log`, `app.log`) ont été créés pour cet exercice.

### Chercher dans plusieurs fichiers avec `*`

Pour chercher le mot "ERROR" dans tous les fichiers qui se terminent par `.log`, on utilise le wildcard `*`.

`grep "ERROR" *.log`{{execute}}

Remarquez quelque chose d'important : `grep` affiche maintenant **le nom du fichier** avant chaque ligne de résultat. Vous savez donc exactement d'où vient chaque erreur.

---

### `-r` : La recherche récursive

Le vrai pouvoir arrive avec l'option `-r` (recursive). Elle dit à `grep` de fouiller le dossier actuel **ET TOUS SES SOUS-DOSSIERS**. Un répertoire `missions/` a été créé pour illustrer cela.

Cherchons le mot "cybersécurité" partout dans l'arborescence `missions/`.

`grep -r "cybersécurité" missions/`{{execute}}

En une seule commande, vous avez scanné toute l'arborescence.

### Affiner la recherche récursive avec `--include`

La commande précédente a peut-être cherché dans des fichiers non pertinents (comme des PDF ou des images). Pour être plus précis, on peut dire à `grep` de n'inclure **que certains types de fichiers**.

Cherchons à nouveau, mais cette fois **uniquement dans les fichiers `.txt`**.

`grep -r --include="*.txt" "cybersécurité" missions/`{{execute}}

C'est l'outil indispensable pour retrouver une variable ou une fonction dans un grand projet de code sans scanner les fichiers inutiles.

---

### Combiner les options

Bien sûr, on peut combiner les options. Faisons une recherche récursive (`-r`) et insensible à la casse (`-i`) pour le mot "incomplet" dans le dossier `missions/`.

`grep -ri "incomplet" missions/`{{execute}}

Vous venez de trouver une information cachée au fond d'un sous-dossier, sans même savoir où elle était !
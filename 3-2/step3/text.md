# Étape 3 : Chercher à grande échelle 🔭

Un détective ne se contente pas d'une seule pièce, il fouille tout le bâtiment ! `grep` peut faire de même avec les fichiers et les dossiers.

Plusieurs fichiers de logs (`system.log`, `app.log`) ont été créés pour cet exercice.

### Chercher dans plusieurs fichiers avec `*`

Pour chercher le mot "ERROR" dans tous les fichiers qui se terminent par `.log`, on utilise le wildcard `*`.

`grep "ERROR" *.log`{{execute}}

Remarquez quelque chose d'important : `grep` affiche maintenant **le nom du fichier** avant chaque ligne de résultat. Vous savez donc exactement d'où vient chaque erreur.

---

### `-r` : La recherche récursive

Le vrai pouvoir arrive avec l'option `-r` (recursive). Elle dit à `grep` de fouiller le dossier actuel **ET TOUS SES SOUS-DOSSIERS**.

Un répertoire `missions/` a été créé avec des sous-dossiers et des fichiers. Cherchons le mot "cybersécurité" partout dans l'arborescence `missions/`.

`grep -r "cybersécurité" missions/`{{execute}}

En une seule commande, vous avez scanné toute l'arborescence. C'est l'outil indispensable pour retrouver une variable ou une fonction dans un grand projet de code.

---

### Combiner les options

Bien sûr, on peut combiner les options. Faisons une recherche récursive (`-r`) et insensible à la casse (`-i`) pour le mot "incomplet" dans le dossier `missions/`.

`grep -ri "incomplet" missions/`{{execute}}

Vous venez de trouver une information cachée au fond d'un sous-dossier, sans même savoir où elle était !
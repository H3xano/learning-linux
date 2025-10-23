Oubliez la recherche de texte exact. Avec les regex, on cherche des **motifs**. Pour cela, il est crucial d'utiliser `grep` avec l'option `-E` (Extended Regex), ou son alias `egrep`.

Un fichier `data.txt` a été préparé. Commençons par une recherche simple. Le `.` (point) signifie "n'importe quel caractère". Cherchons les mots de 3 lettres "b", suivi de n'importe quoi, suivi de "t".

`egrep "b.t" data.txt`{{execute}}

`grep -E` (ou `egrep`) est plus puissant et plus simple à utiliser pour les regex. Prenez l'habitude de l'utiliser !

---

### Les quantificateurs : Combien de fois ?

Les quantificateurs s'appliquent au caractère *juste avant* eux.
- `?` : 0 ou 1 fois (optionnel)
- `*` : 0 ou plusieurs fois
- `+` : 1 ou plusieurs fois

Cherchons les variations de l'orthographe "color" / "colour" avec `?`.

`egrep "colou?r" data.txt`{{execute}}

Maintenant, cherchons le mot "fichier" au singulier et au pluriel.

`egrep "fichiers?" data.txt`{{execute}}

---

### La combinaison magique : `.*`

La combinaison `.` et `*` est la plus utilisée. `.*` signifie "n'importe quelle séquence de n'importe quels caractères". C'est le joker ultime.

Cherchons les lignes qui contiennent "start", suivi de n'importe quoi, suivi de "end".

`egrep "start.*end" data.txt`{{execute}}
Souvent, on ne veut que le début ou la fin d'un fichier. `head` (la tête) et `tail` (la queue) sont parfaits pour ça ! Par défaut, ils affichent 10 lignes.

### Voir le début avec `head`

`head long_log.txt`{{execute}}

### Voir la fin avec `tail`

`tail long_log.txt`{{execute}}

---

### Préciser le nombre de lignes

On peut choisir combien de lignes afficher avec l'option `-n`.

Pour voir les **5 premières lignes** :
`head -n 5 long_log.txt`{{execute}}

Pour voir les **3 dernières lignes** :
`tail -n 3 long_log.txt`{{execute}}

---

### Ignorer les premières lignes avec `tail`

Une utilisation très fréquente de `tail` est d'ignorer un en-tête. Le signe `+` change tout : `tail -n +198` n'affiche pas les 198 dernières lignes, mais tout le contenu **à partir de la ligne 198** !

`tail -n +198 long_log.txt`{{execute}}

Vous voyez les lignes 198, 199, 200 et la ligne de fin. C'est la technique parfaite pour sauter les en-têtes d'un fichier CSV, par exemple.

---

### La Combinaison Magique : Isoler une section ! 🚀

Et si on veut les lignes 16 à 20 ? On peut combiner `head` et `tail` avec un "pipe" (`|`), qui envoie le résultat de la première commande à la seconde.

**La logique :**
1.  Prendre les 20 premières lignes (`head -n 20`)
2.  ...et de ce résultat, prendre les 5 dernières lignes (`tail -n 5`)

`head -n 20 long_log.txt | tail -n 5`{{execute}}

Et voilà ! Vous avez précisément extrait les lignes 16, 17, 18, 19 et 20. C'est une technique extrêmement puissante !
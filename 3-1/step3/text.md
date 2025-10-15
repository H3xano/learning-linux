# Étape 3 : `head` & `tail` - L'extraction chirurgicale 🔬

Souvent, on ne veut que le début ou la fin d'un fichier. `head` (la tête) et `tail` (la queue) sont parfaits pour ça !

Par défaut, ils affichent les 10 premières ou 10 dernières lignes.

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

### La Combinaison Magique : Isoler une section ! 🚀

Et si on veut les lignes 16 à 20 ? On peut combiner `head` et `tail` avec un "pipe" (`|`), qui envoie le résultat de la première commande à la seconde.

**La logique :**
1.  Prendre les 20 premières lignes (`head -n 20`)
2.  ...et de ce résultat, prendre les 5 dernières lignes (`tail -n 5`)

`head -n 20 long_log.txt | tail -n 5`{{execute}}

Et voilà ! Vous avez précisément extrait les lignes 16, 17, 18, 19 et 20. C'est une technique extrêmement puissante !
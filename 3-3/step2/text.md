# Étape 2 : La précision absolue

Le `.` est trop vague. Pour être précis, on utilise les **classes de caractères** avec `[ ]`.

### Les classes `[ ]`

`[abc]` signifie "un caractère qui est soit 'a', soit 'b', soit 'c'". On peut aussi utiliser des intervalles.
- `[0-9]` : N'importe quel chiffre.
- `[a-z]` : N'importe quelle lettre minuscule.
- `[A-Z]` : N'importe quelle lettre majuscule.

Cherchons le code produit dans notre fichier, qui a le format `ABC-` suivi de chiffres.

`egrep "[A-Z]{3}-[0-9]+" data.txt`{{execute}}

### La négation `[^...]`

En plaçant un `^` **à l'intérieur** des crochets, on inverse la logique. `[^0-9]` signifie "n'importe quel caractère SAUF un chiffre".

---

### L'ancrage : `^` et `$`

Pour être encore plus précis, on peut spécifier la **position** dans la ligne.
- `^` : Début de la ligne.
- `$` : Fin de la ligne.

Cherchons les lignes qui **commencent** par "START".

`egrep "^START" data.txt`{{execute}}

Maintenant, les lignes qui **se terminent** par "transaction.".

`egrep "transaction.$" data.txt`{{execute}}

---

### La combinaison ultime : `^motif$`

En combinant les deux, on cherche une ligne qui correspond **exactement** au motif, sans rien avant ni après. Cherchons la ligne qui contient uniquement "OK".

`egrep "^OK$" data.txt`{{execute}}
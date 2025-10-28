Le `.` est trop vague. Pour être précis, on utilise les **classes de caractères** avec `[ ]`.

### Les classes `[ ]`

`[abc]` signifie "un caractère qui est soit 'a', soit 'b', soit 'c'". On peut aussi utiliser des intervalles :
- `[0-9]` : N'importe quel chiffre.
- `[a-z]` : N'importe quelle lettre minuscule.
- `[A-Z]` : N'importe quelle lettre majuscule.

Cherchons le code produit `XYZ-98765`. Pour cela, nous allons chercher un motif de 3 lettres majuscules, un tiret, puis 5 chiffres. C'est un peu long, mais nous verrons une méthode plus courte au prochain step !

`egrep "[A-Z][A-Z][A-Z]-[0-9][0-9][0-9][0-9][0-9]" data.txt`{{execute}}

### La négation `[^...]`

En plaçant un `^` **à l'intérieur** des crochets, on inverse la logique. `[^0-9]` signifie "n'importe quel caractère SAUF un chiffre".

Utilisons cette technique pour afficher toutes les lignes de `data.txt` qui ne commencent **pas** par un `#` (c'est-à-dire, ignorer les commentaires).

`egrep "^[^#]" data.txt`{{execute}}

---

### L'ancrage : `^` et `$`

Pour être encore plus précis, on peut spécifier la **position** dans la ligne.
- `^` : Début de la ligne.
- `$` : Fin de la ligne.

Cherchons les lignes qui **commencent** par "START".

`egrep "^START" data.txt`{{execute}}

Maintenant, les lignes qui **se terminent** par "transaction.". Attention, le `.` est un caractère spécial ! Il faut l'échapper avec `\` pour qu'il soit interprété littéralement.

`egrep "transaction\.$" data.txt`{{execute}}

---

### La combinaison ultime : `^motif$`

En combinant les deux, on cherche une ligne qui correspond **exactement** au motif, sans rien avant ni après. Cherchons la ligne qui contient uniquement "OK".

`egrep "^OK$" data.txt`{{execute}}
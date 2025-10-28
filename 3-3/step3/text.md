Vous maîtrisez les bases, passons au niveau supérieur !

### Les quantificateurs précis `{}`

Au Step 2, nous avons écrit une regex très longue pour trouver `XYZ-98765`. Les quantificateurs précis sont la solution élégante.
- `{n}` : Exactement *n* fois.
- `{n,m}` : Entre *n* et *m* fois.
- `{n,}` : Au moins *n* fois.

Réécrivons notre recherche précédente : "3 majuscules, un tiret, 5 chiffres".

`egrep "[A-Z]{3}-[0-9]{5}" data.txt`{{execute}}

Maintenant, cherchons les lignes où la chaîne `test-` apparaît **au moins deux fois**.

`egrep "(test-){2,}" data.txt`{{execute}}

### Les groupes `()` et l'alternative `|`

Les parenthèses `()` permettent de grouper des motifs. C'est essentiel pour appliquer un quantificateur à une séquence (comme `(test-){2,}`) ou pour utiliser une alternative `|` (OU).

Cherchons toutes les lignes qui contiennent soit le mot `ERROR`, soit le mot `WARNING`.

`egrep "(ERROR|WARNING)" data.txt`{{execute}}

---

### L'échappement `\`

Que faire si vous voulez chercher un caractère spécial comme `.` ou `*` ? Il faut "l'échapper" avec un backslash `\`, pour qu'il perde son pouvoir.

`\.` cherche un point littéral.
`\*` cherche un astérisque littéral.

Cherchons l'adresse IP `192.168.1.1` dans notre fichier. Sans échapper les points, la recherche serait fausse car `.` matcherait n'importe quel caractère !

`egrep "192\.168\.1\.1" data.txt`{{execute}}

Vous voyez maintenant comment construire des motifs complexes et précis. Avec ces outils, presque aucune recherche n'est impossible !
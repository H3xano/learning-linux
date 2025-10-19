# Étape 3 : Regex Avancées - L'arsenal de l'expert

Vous maîtrisez les bases, passons au niveau supérieur !

### Les quantificateurs précis `{}`

Plutôt que `*` ou `+`, on peut spécifier un nombre exact de répétitions.
- `{n}` : Exactement *n* fois.
- `{n,m}` : Entre *n* et *m* fois.
- `{n,}` : Au moins *n* fois.

Cherchons un code de 5 chiffres dans notre fichier.

`egrep "[0-9]{5}" data.txt`{{execute}}

---

### Les groupes `()`

Les parenthèses `()` permettent de grouper des motifs pour leur appliquer un quantificateur.

Cherchons une répétition du mot "test-" trois fois. La regex `(test-){3}` signifie "le groupe 'test-' répété exactement 3 fois".

`egrep "(test-){3}" data.txt`{{execute}}

---

### L'échappement `\`

Que faire si vous voulez chercher un caractère spécial comme `.` ou `*` ? Il faut "l'échapper" avec un backslash `\`.

`\.` cherche un point littéral.
`\*` cherche un astérisque littéral.

Cherchons l'adresse IP `192.168.1.1` dans notre fichier. Sans échapper les points, la recherche serait fausse !

`egrep "192\.168\.1\.1" data.txt`{{execute}}

Vous voyez maintenant comment construire des motifs complexes et précis. Avec ces outils, presque aucune recherche n'est impossible !
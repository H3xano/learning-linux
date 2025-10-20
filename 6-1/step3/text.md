Comment Linux décide-t-il de vos droits ? Il suit un ordre strict :
1. Êtes-vous le **propriétaire** ? Si oui, seules ces permissions s'appliquent. FIN.
2. Sinon, appartenez-vous au **groupe** ? Si oui, seules ces permissions s'appliquent. FIN.
3. Sinon, vous êtes dans les **autres**.

### Le piège des permissions effectives

Un fichier spécial `rapport_piege.txt` a été créé. Il appartient à `testuser:testgroup` et a les permissions `-rw-rwx---` (670). Votre utilisateur `learner` a été ajouté au groupe `testgroup`.

`ls -l rapport_piege.txt`{{execute}}

En tant que membre du groupe, vous devriez avoir les droits `rwx`. Essayons d'écrire dedans.

`echo "test" >> rapport_piege.txt`{{execute}}

Cela fonctionne ! Car l'algorithme a vérifié :
1.  Êtes-vous le propriétaire (`testuser`) ? NON.
2.  Appartenez-vous au groupe (`testgroup`) ? OUI.
3.  Vos permissions sont donc `rwx`.

---
### `umask` : Les permissions par défaut

Quand vous créez un fichier, d'où viennent ses permissions par défaut ? De `umask`. C'est un "masque" qui retire des permissions.

`umask`{{execute}}

Une valeur comme `0022` signifie que `w` (2) est retiré au groupe et aux autres.
-   Fichier (base 666) - 022 = **644** (`rw-r--r--`).
-   Dossier (base 777) - 022 = **755** (`rwxr-xr-x`).

Créons un fichier pour vérifier.

`touch nouveau_fichier_test.txt`{{execute}}
`ls -l nouveau_fichier_test.txt`{{execute}}

Le fichier a bien les permissions `rw-r--r--` !
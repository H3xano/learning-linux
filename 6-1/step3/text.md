Comment Linux décide-t-il de vos droits ? Il suit un ordre strict :
1.  Êtes-vous le **propriétaire** ? Si oui, seules ces permissions s'appliquent. **FIN.**
2.  Sinon, appartenez-vous au **groupe** ? Si oui, seules ces permissions s'appliquent. **FIN.**
3.  Sinon, vous êtes dans les **autres**.

### Le piège des permissions effectives

Un fichier spécial `rapport_piege.txt` a été créé. Vous, `learner`, **n'êtes pas** le propriétaire, mais vous **appartenez** à son groupe. Regardons ses droits :

`ls -l rapport_piege.txt`{{execute}}

Vous voyez `---rwx---`.
-   Le propriétaire (`testuser`) n'a **aucun droit** (`---`).
-   Le groupe (`equipe`) a **tous les droits** (`rwx`).

Logiquement, puisque vous êtes dans le groupe `equipe`, vous devriez pouvoir écrire dedans, n'est-ce pas ? Essayons.

`echo "test" >> rapport_piege.txt`{{execute}}

**Succès !** Pourquoi ?
1.  Linux vérifie : Êtes-vous le propriétaire `testuser` ? -> **NON**.
2.  Il continue : Appartenez-vous au groupe `equipe` ? -> **OUI**.
3.  L'algorithme s'arrête et applique les permissions du groupe : `rwx`. Vous avez donc le droit d'écrire !

---

### `umask` : Les permissions par défaut

Quand vous créez un fichier, d'où viennent ses permissions ? De `umask`. `umask` est un "masque" qui retire des permissions.

Voyons votre `umask` actuel.

`umask`{{execute}}

Une valeur comme `0002` signifie que `w` (2) est retiré aux "autres".
-   Pour un **fichier** (base 666), `666 - 002 = 664` (`rw-rw-r--`).
-   Pour un **dossier** (base 777), `777 - 002 = 775` (`rwxrwxr-x`).

Créons un fichier pour vérifier.

`touch nouveau_fichier_test.txt`{{execute}}
`ls -l nouveau_fichier_test.txt`{{execute}}

Le fichier a bien les permissions `rw-rw-r--` !
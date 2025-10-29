Comment Linux décide-t-il de vos droits ? Il suit un ordre strict :
1.  Êtes-vous le **propriétaire** ? Si oui, seules ces permissions s'appliquent. **FIN.**
2.  Sinon, appartenez-vous au **groupe** ? Si oui, seules ces permissions s'appliquent. **FIN.**
3.  Sinon, vous êtes dans les **autres**.

### Le Piège des Permissions Effectives

Un fichier spécial `rapport_piege.txt` a été créé. Vous, `learner`, n'êtes **pas** le propriétaire, mais vous **appartenez** à son groupe. Regardons ses droits :

`ls -l rapport_piege.txt`{{execute}}

Vous voyez `---rwx---`. Le groupe a tous les droits. Puisque vous êtes dans le groupe `equipe`, essayons d'écrire dedans.

`echo "test" >> rapport_piege.txt`{{execute}}

**Succès !** Linux a vu que vous n'étiez pas le propriétaire, a ensuite vérifié votre appartenance au groupe et vous a appliqué les permissions `rwx`.

### Le Contre-Piège : La Priorité du Propriétaire

Maintenant, regardons `rapport_piege2.txt`. Cette fois, vous **êtes** le propriétaire.

`ls -l rapport_piege2.txt`{{execute}}

Les permissions sont `---rwx---`. Le groupe a tous les droits, mais le propriétaire n'en a aucun. Que va-t-il se passer ?

`echo "test" >> rapport_piege2.txt`{{execute}}

**Permission denied !** Pourquoi ? Parce que Linux suit son algorithme :
1. Êtes-vous le **propriétaire** ? -> **OUI**.
2. L'algorithme **s'arrête** et applique les permissions du propriétaire : `---`. Vous n'avez aucun droit, même si votre groupe en a !

---

### `umask` : Les permissions par défaut

Quand vous créez un fichier, d'où viennent ses permissions ? De `umask`. `umask` est un "masque" qui retire des permissions. Voyons votre `umask` actuel.

`umask`{{execute}}

Une valeur comme `0002` signifie que `w` (2) est retiré aux "autres". Créons un fichier pour vérifier.

`touch nouveau_fichier_test.txt`{{execute}}
`ls -l nouveau_fichier_test.txt`{{execute}}

Le fichier a bien les permissions `rw-rw-r--` ! (Base 666 - umask 002 = 664)
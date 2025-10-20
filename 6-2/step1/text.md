Avant de changer quoi que ce soit, un bon admin doit savoir observer. La commande `ls -l` est notre principal outil pour cela.

`ls -l`{{execute}}

Regardez la sortie. Les 3ème et 4ème colonnes indiquent le propriétaire et le groupe.
`permissions 1` **`owner`** **`group`** `size date name`

Pour le fichier `rapport.txt`, le propriétaire est `learner` et le groupe est `learner`.

---
### Votre identité

Pour savoir qui vous êtes et à quels groupes vous appartenez, utilisez les commandes `whoami` et `groups`.

`whoami`{{execute}}
`groups`{{execute}}

La commande `id` vous donne une vue encore plus complète, avec vos numéros d'identification uniques (UID et GID).

`id`{{execute}}

Vous savez maintenant observer la propriété d'un fichier et connaître votre propre identité sur le système.
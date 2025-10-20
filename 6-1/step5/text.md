Parfois, le système `Owner/Group/Others` n'est pas assez précis. On peut ajouter des permissions pour des utilisateurs spécifiques avec les **ACL** (Access Control Lists).

Quand un fichier a des ACL, `ls -l` l'indique avec un `+` à la fin des permissions. Un fichier `fichier_acl.txt` a été préparé pour vous.

`ls -l fichier_acl.txt`{{execute}}

Voyez le **`+`** à la fin de `-rw-rw----+`. C'est un signal : "Attention, il y a des permissions cachées !".

Pour voir ces permissions spéciales, on utilise `getfacl`.

`getfacl fichier_acl.txt`{{execute}}

Vous voyez maintenant les permissions de base (`user::`, `group::`, `other::`) ET une ligne supplémentaire `user:specific_user:rw-` qui est une ACL.
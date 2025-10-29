Comment savoir où pointe un lien, ou trouver les liens brisés sur son système ?

### `readlink` : Lire la destination d'un lien

La commande `readlink` vous montre le chemin exact stocké dans un lien.

`readlink /tmp/lien_relatif`{{execute}}

L'option `-f` est encore plus utile : elle vous donne le chemin **absolu et final** de la cible.

`readlink -f /tmp/lien_relatif`{{execute}}

La commande échoue, prouvant que le lien est bien brisé.

---

### `find` : Trouver les liens brisés

Pour trouver tous les liens brisés dans une arborescence, on utilise `find` avec l'option `-xtype l`. Un lien brisé pré-créé `~/lien_casse_initial` existe pour cet exercice.

`find ~ -xtype l`{{execute}}

`find` a localisé tous les liens de votre `home` dont la cible n'existe pas. C'est un outil de diagnostic très puissant.

### Réparer un lien

La méthode la plus professionnelle pour réparer un lien est de le recréer en forçant son remplacement avec les options `-s` (symbolique) et `-f` (force), en utilisant un chemin absolu.

`ln -sf /home/learner/data/source.txt /tmp/lien_relatif`{{execute}}

Cette commande unique a remplacé l'ancien lien brisé par le nouveau, qui est correct. Vérifions qu'il fonctionne maintenant.

`cat /tmp/lien_relatif`{{execute}}

Succès ! Vous savez maintenant inspecter, trouver et réparer les portails de votre système.
# Étape 1 : La puissance cachée de `ls`

La commande `ls` est bien plus qu'un simple outil de listage. Avec quelques options, elle devient un puissant scanner.

### Les options fondamentales

-   `-l` : Format **l**ong (détaillé).
-   `-a` : **A**ffiche tout, même les fichiers cachés (ceux qui commencent par `.`).
-   `-h` : Taille **h**umainement lisible (K, M, G).

Essayons la combinaison la plus célèbre, que les admins appellent affectueusement "lah" : `ls -lah`.

`ls -lah`{{execute}}

Vous voyez maintenant tous les fichiers, y compris les cachés, avec leurs permissions, leur propriétaire, une taille lisible et leur date de modification.

---

### Trier les résultats

Parfois, l'ordre alphabétique n'est pas ce que l'on veut.
-   `-t` : Trie par date de modification (le plus récent en premier).
-   `-S` : Trie par taille (le plus gros en premier).
-   `-r` : **R**everse l'ordre de tri.

Listons les fichiers du répertoire `/etc` en les triant par **date de modification inversée** (`-ltr`). Cela nous montre les fichiers les plus anciens en premier et les plus récents à la fin, ce qui est très utile pour voir les derniers changements.

`ls -ltr /etc`{{execute}}

Faites défiler jusqu'en bas pour voir les fichiers qui ont été modifiés le plus récemment sur ce système !
Un disque plein peut paralyser un serveur. Deux commandes sont vitales pour gérer l'espace.

### `df` : Le bilan global

`df -h` (**d**isk **f**ree, **-h**uman readable) vous donne une vue d'ensemble de l'espace sur toutes vos partitions.

`df -h`{{execute}}

Repérez la colonne `Use%`. Si une partition approche des 90% ou 100%, c'est une alerte rouge !

### `df -i` : Le mystère des inodes

Un disque peut être "plein" même s'il reste de l'espace, si tous les **inodes** (les "tickets" pour enregistrer les fichiers) sont utilisés. `df -i` vérifie cela.

`df -i`{{execute}}

Regardez la colonne `IUse%`. Si elle est à 100%, vous ne pouvez plus créer de nouveaux fichiers !

---
### `du` : Trouver qui consomme l'espace

`df` vous dit que la partition `/` est pleine, mais *quel dossier* est le coupable ? `du` (**d**isk **u**sage) vous le dit.

Utilisons `du` pour trouver les 5 plus gros dossiers dans `/var`.
-   `-h` : Taille lisible.
-   `--max-depth=1` : Ne regarde qu'un niveau de profondeur.
-   `| sort -rh` : Trie les résultats par taille, du plus grand au plus petit.

`sudo du -h --max-depth=1 /var | sort -rh | head -n 5`{{execute}}

Vous avez instantanément identifié les plus gros consommateurs dans `/var`. Le dossier `/var/log` est souvent un bon suspect !
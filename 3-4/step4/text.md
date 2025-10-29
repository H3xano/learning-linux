Voyons maintenant pourquoi le Mode Normal est si puissant pour restructurer un fichier.

Rouvrons notre fichier de configuration :

`vim nginx.conf.sample`{{execute}}

### Couper, Copier, Coller

-   `dd` : **Coupe** (delete) la ligne entière où se trouve votre curseur.
-   `yy` : **Copie** (yank) la ligne entière.
-   `p` : **Colle** (paste) le contenu coupé ou copié **après** la ligne actuelle.

**Votre mission : Réorganiser la configuration**
1.  Placez votre curseur sur la ligne `pid /run/nginx.pid;` (utilisez `j`).
2.  Tapez `dd` pour couper cette ligne. Elle disparaît.
3.  Descendez sur la ligne `worker_connections 768;`.
4.  Tapez `p` pour coller la ligne `pid` juste en dessous.
5.  Maintenant, placez vous sur la ligne `gzip on;`.
6.  Tapez `yy` pour la copier.
7.  Descendez d'une ligne et tapez `p` pour la coller, créant ainsi un doublon.
8.  Une fois terminé, sauvegardez et quittez avec `:wq`.
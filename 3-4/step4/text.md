# Étape 4 : Vim (Partie 3) - La Puissance du Mode Normal

Maintenant que vous savez entrer, écrire, sauvegarder et quitter, voyons *pourquoi* le Mode Normal est si puissant.

Rouvrons notre fichier.

`vim config_template.txt`{{execute}}

En Mode Normal, vous pouvez manipuler le texte à une vitesse fulgurante.

### Couper, Copier, Coller

-   `dd` : **Coupe** (delete) la ligne entière où se trouve votre curseur.
-   `yy` : **Copie** (yank) la ligne entière.
-   `p` : **Colle** (paste) le contenu coupé ou copié après la ligne actuelle.

**Votre mission :**
1.  Placez votre curseur sur la ligne `user = admin` (utilisez les flèches ou les touches `j`/`k`).
2.  Tapez `dd` pour couper cette ligne. Elle disparaît !
3.  Placez votre curseur sur la ligne `port = 8080`.
4.  Tapez `yy` pour la copier.
5.  Allez sur la dernière ligne du fichier.
6.  Tapez `p` pour coller la ligne copiée.
7.  Une fois terminé, sauvegardez et quittez avec `:wq`.

Vous venez d'effleurer la puissance de `vim`. En combinant ces simples commandes, les utilisateurs expérimentés peuvent restructurer des fichiers entiers en quelques secondes.
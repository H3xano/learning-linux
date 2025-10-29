Bienvenue dans `vim`. Pour le maîtriser, nous utiliserons un fichier de configuration plus réaliste.

Ouvrons-le :

`vim nginx.conf.sample`{{execute}}

Vous êtes en **Mode Normal**. Chaque touche est une commande. Pour devenir un "ninja", vous devez naviguer sans quitter le clavier.

**Mission : Naviguer avec précision**
1.  Allez **instantanément** à la dernière ligne du fichier en tapant `G`.
2.  Revenez **instantanément** à la première ligne en tapant `gg`.
3.  Utilisez la touche `j` pour descendre ligne par ligne jusqu'à `worker_processes 4;`.
4.  Utilisez la touche `w` (word) pour sauter de mot en mot jusqu'au chiffre `4`.
5.  Passez en **Mode Insertion** en appuyant sur `i`.
6.  Remplacez le `4` par un `8`.
7.  Appuyez sur **`Esc`** pour revenir en **Mode Normal**.

Ne quittez pas `vim` ! À la prochaine étape, nous verrons comment annuler une erreur et quitter en toute sécurité.
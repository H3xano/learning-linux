# Étape 4 : SGID et Sticky Bit - Protéger les Dossiers Partagés

Le `SGID` et le `Sticky Bit` sont cruciaux pour la collaboration en équipe.

### Le SGID (`Set Group ID`) sur un dossier

Quand `SGID` est activé sur un dossier, tous les nouveaux fichiers créés à l'intérieur **héritent automatiquement** du groupe du dossier, pas du groupe de l'utilisateur qui les crée.

Regardons le dossier `shared_folder/`.

`ls -ld shared_folder/`{{execute}}

Activons le `SGID` dessus. En symbolique, c'est `g+s`. En octal, on ajoute `2` devant.

`chmod g+s shared_folder/`{{execute}}

Regardez les permissions. Le `x` du groupe est devenu un `s`.

`ls -ld shared_folder/`{{execute}}

Maintenant, créez un fichier à l'intérieur.

`touch shared_folder/mon_fichier_partage.txt`{{execute}}
`ls -l shared_folder/mon_fichier_partage.txt`{{execute}}

Le nouveau fichier appartient bien au groupe `equipe` (hérité du dossier), et non à votre groupe `learner` !

### Le Sticky Bit

Le `Sticky Bit` protège un dossier où tout le monde peut écrire (comme `/tmp`). Il empêche un utilisateur de supprimer les fichiers d'un autre.

Regardez les permissions de `public_space/`. Il est en `777` (tout le monde peut tout faire).

`ls -ld public_space/`{{execute}}

Activons le **Sticky Bit**. En symbolique, c'est `+t`. En octal, on ajoute `1` devant.

`chmod +t public_space/`{{execute}}
`ls -ld public_space/`{{execute}}

Le dernier `x` est devenu un `t`. Maintenant, si un autre utilisateur créait un fichier ici, vous ne pourriez pas le supprimer.
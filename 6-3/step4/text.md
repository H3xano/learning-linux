# Étape 4 : SGID et Sticky Bit - Protéger les Dossiers Partagés

Le `SGID` et le `Sticky Bit` sont cruciaux pour la collaboration en équipe.

### Le SGID (`Set Group ID`) sur un dossier

Quand `SGID` est activé sur un dossier, tous les nouveaux fichiers créés à l'intérieur **héritent automatiquement** du groupe du dossier.

Regardons le dossier `shared_folder/`. Il appartient au groupe `equipe`.

`ls -ld shared_folder/`{{execute}}

Activons le `SGID` dessus. Nous allons utiliser le mode **octal**. Les permissions actuelles sont `775` (`rwxrwxr-x`). Le bit SGID a la valeur `2`. Nous allons donc appliquer `2775`.

`chmod 2775 shared_folder/`{{execute}}

Regardez les permissions. Le `x` du groupe est maintenant devenu un `s`.

`ls -ld shared_folder/`{{execute}}

Maintenant, créez un fichier à l'intérieur.

`touch shared_folder/mon_fichier_partage.txt`{{execute}}
`ls -l shared_folder/mon_fichier_partage.txt`{{execute}}

Le nouveau fichier appartient bien au groupe **`equipe`** (hérité du dossier), et non à votre groupe primaire `learner` !

### Le Sticky Bit

Le `Sticky Bit` protège un dossier où tout le monde peut écrire. Il empêche un utilisateur de supprimer les fichiers d'un autre. Le bit Sticky a la valeur octale `1`.

Regardons les permissions de `public_space/`. Il est en `777`.

`ls -ld public_space/`{{execute}}

Activons le **Sticky Bit**. Nous allons appliquer `1777`.

`chmod 1777 public_space/`{{execute}}
`ls -ld public_space/`{{execute}}

Le dernier `x` est devenu un `t`. Maintenant, si un autre utilisateur créait un fichier ici, vous ne pourriez pas le supprimer.
Le `SGID` et le `Sticky Bit` sont cruciaux pour la collaboration en équipe.

### Le SGID (`Set Group ID`) sur un dossier

Quand `SGID` est activé sur un dossier, les nouveaux fichiers créés à l'intérieur **héritent automatiquement** du groupe du dossier. C'est parfait pour les projets d'équipe.

Un dossier `shared_folder` a été préparé pour vous. Il appartient au groupe `equipe`.

`ls -ld shared_folder`{{execute}}

Activons le SGID avec la notation symbolique `g+s`.

`sudo chmod g+s shared_folder`{{execute}}
`ls -ld shared_folder`{{execute}}

Remarquez le `s` à la place du `x` du groupe (`rws`). C'est la marque du SGID.
Maintenant, créons un fichier à l'intérieur et observons la magie de l'héritage.

`touch shared_folder/rapport_equipe.txt`{{execute}}
`ls -l shared_folder/rapport_equipe.txt`{{execute}}

**Révélation !** Bien que l'utilisateur `learner` ait créé le fichier, le groupe propriétaire est `equipe`, hérité du dossier grâce au SGID.

### Le Sticky Bit

Le `Sticky Bit` protège un dossier où tout le monde peut écrire (comme `public_space`). Il empêche un utilisateur de supprimer les fichiers d'un autre.

Appliquons le Sticky Bit sur `public_space`. En octal, le Sticky Bit a la valeur `1`. La permission `1777` est standard pour les dossiers publics comme `/tmp`.

`chmod 1777 public_space`{{execute}}
`ls -ld public_space`{{execute}}

Le dernier `x` est devenu un `t`. Maintenant, dans ce dossier, vous ne pouvez supprimer que les fichiers qui vous appartiennent.

### Combinaison Pro : SGID + Sticky Bit

Pour un dossier d'équipe parfait, on combine souvent SGID et Sticky Bit.
- `SGID` (2000) : pour l'héritage du groupe.
- `Sticky Bit` (1000) : pour la protection des fichiers.
- `rwxrwx---` (770) : pour les droits de l'équipe.

Code final : **3770**. Appliquons cette configuration pro à `shared_folder`.

`chmod 3770 shared_folder`{{execute}}
`ls -ld shared_folder`{{execute}}
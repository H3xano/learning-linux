# Étape 4 : SGID et Sticky Bit - Protéger les Dossiers Partagés

Le `SGID` et le `Sticky Bit` sont cruciaux pour la collaboration en équipe.

### Le SGID (`Set Group ID`) sur un dossier

Quand `SGID` est activé sur un dossier, les nouveaux fichiers créés à l'intérieur **héritent automatiquement** du groupe du dossier.

**Note importante :** Dans certains environnements sécurisés comme celui-ci, il peut être impossible de définir le bit SGID sur vos propres dossiers. Nous allons donc observer son effet sur un dossier système où il est déjà activé : `/var/mail`.

Regardons les permissions de `/var/mail`.

`ls -ld /var/mail`{{execute}}

Vous devriez voir quelque chose comme `drwxrwsr-x`. Le `s` à la place du `x` du groupe indique que le **SGID est actif**. Le groupe propriétaire est `mail`.

Maintenant, créons (avec `sudo`) un fichier test à l'intérieur.

`sudo touch /var/mail/test_sgid.txt`{{execute}}

Inspectons le nouveau fichier.

`sudo ls -l /var/mail/test_sgid.txt`{{execute}}

**Révélation !** Bien que `root` ait créé le fichier, le groupe propriétaire est `mail`, hérité du dossier grâce au SGID ! C'est la preuve de l'héritage automatique. Nettoyons notre test.

`sudo rm /var/mail/test_sgid.txt`{{execute}}

### Le Sticky Bit

Le `Sticky Bit` protège un dossier où tout le monde peut écrire. Il empêche un utilisateur de supprimer les fichiers d'un autre. Le bit Sticky a la valeur octale `1`.

Regardons les permissions de `public_space/`.

`ls -ld public_space/`{{execute}}

Activons le **Sticky Bit** en appliquant `1777`.

`chmod 1777 public_space/`{{execute}}
`ls -ld public_space/`{{execute}}

Le dernier `x` est devenu un `t`. Maintenant, si un autre utilisateur créait un fichier ici, vous ne pourriez pas le supprimer.
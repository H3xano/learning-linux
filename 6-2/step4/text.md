Changer les fichiers un par un, c'est long. L'option `-R` (récursive) applique une commande à un dossier et **à tout ce qu'il contient**. C'est extrêmement puissant, mais aussi dangereux !

Un dossier `projet_alpha` a été créé pour vous. Regardons son contenu et ses propriétaires actuels.

`ls -lR projet_alpha`{{execute}}

Tout appartient à `learner:learner`.

---
### Transférer tout un dossier

Maintenant, transférons la propriété de tout le dossier `projet_alpha` et de son contenu à `testuser:equipe`.

**Attention : n'utilisez jamais `-R` sur des dossiers système comme `/etc` ou `/` !**

`sudo chown -R testuser:equipe projet_alpha`{{execute}}

Vérifions le résultat.

`ls -lR projet_alpha`{{execute}}

En une seule commande, vous avez changé la propriété du dossier, du sous-dossier, et de tous les fichiers à l'intérieur !
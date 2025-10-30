Nous allons maintenant simuler le cas le plus courant : configurer un dossier pour qu'une équipe puisse collaborer efficacement.

Le but : tout nouveau fichier créé dans le dossier `projet_bravo` doit automatiquement appartenir au groupe `webteam`.

### Étape A : Assigner le groupe

D'abord, changeons le groupe du dossier `projet_bravo` et de son contenu pour `webteam`.

`sudo chgrp -R webteam projet_bravo`{{execute}}

### Étape B : La magie du SGID

Maintenant, nous allons activer le bit **SGID** (`Set Group ID`) sur le dossier. Ce bit force tous les nouveaux fichiers et dossiers créés à l'intérieur à **hériter du groupe du dossier parent**, au lieu du groupe primaire de l'utilisateur.

`sudo chmod g+s projet_bravo`{{execute}}

Vérifions le dossier. Voyez le `s` à la place du `x` pour le groupe. C'est le SGID !

`ls -ld projet_bravo`{{execute}}

### Étape C : Le test final

Créons un nouveau fichier dans le dossier.

`touch projet_bravo/test.js`{{execute}}

Maintenant, vérifions son propriétaire et son groupe.

`ls -l projet_bravo/test.js`{{execute}}

Regardez bien : le propriétaire est `learner` (celui qui a créé le fichier), mais le groupe est `webteam` ! L'héritage a fonctionné. Vous venez de mettre en place un dossier de collaboration professionnel.
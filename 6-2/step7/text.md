Nous allons maintenant simuler le cas le plus courant : configurer un dossier pour qu'une équipe puisse collaborer efficacement.

Le but : le dossier `projet_bravo` doit appartenir au groupe `webteam` et les membres de l'équipe doivent pouvoir y modifier des fichiers.

### Étape A : Assigner le groupe

D'abord, changeons le groupe du dossier `projet_bravo` et de son contenu pour `webteam`.

`sudo chgrp -R webteam projet_bravo`{{execute}}

### Étape B : Donner les droits de modification

Changer le groupe ne suffit pas. Il faut aussi donner les permissions d'écriture (`w`) au groupe pour que ses membres puissent collaborer.

`sudo chmod -R g+w projet_bravo`{{execute}}

Vérifions l'état du dossier. Vous devriez voir les droits `rwx` pour l'utilisateur (`learner`) et `rwx` pour le groupe (`webteam`).

`ls -ld projet_bravo`{{execute}}

### Étape C : Le test de création

Créons un nouveau fichier dans le dossier.

`touch projet_bravo/test.js`{{execute}}

Maintenant, vérifions son propriétaire et son groupe.

`ls -l projet_bravo/test.js`{{execute}}

---
### Le Défi de l'Héritage

Regardez bien : le propriétaire est `learner` (correct), mais le groupe est `learner`, pas `webteam` ! Pourquoi ? Par défaut, tout nouveau fichier hérite du **groupe primaire** de son créateur.

C'est une limitation courante. Comment forcer les nouveaux fichiers à hériter du groupe du dossier parent (`webteam`) ? Il existe une permission spéciale pour cela, le **SGID**, que nous découvrirons dans le prochain lab (6.3) !

Vous avez parfaitement configuré un dossier de collaboration avec les outils de cette section.
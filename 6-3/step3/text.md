# Étape 3 : SUID et SGID - Les Permissions d'Exécution Spéciales

`SUID` et `SGID` sont des permissions avancées qui permettent à un programme de s'exécuter avec les droits de son **propriétaire** ou de son **groupe**.

### Le SUID (`Set User ID`)

Un script `suid_script.sh` appartenant à `root` a été préparé. Il affiche simplement l'utilisateur qui l'exécute.

Essayons de le lancer normalement.

`./suid_script.sh`{{execute}}

Il affiche `learner`. Maintenant, l'administrateur va activer le bit **SUID**. En symbolique, c'est `u+s`. En octal, on ajoute `4` devant.

`sudo chmod u+s suid_script.sh`{{execute}}

Regardez les permissions. Le `x` du propriétaire est devenu un `s`.

`ls -l suid_script.sh`{{execute}}

Ré-exécutez le script.

`./suid_script.sh`{{execute}}

**Magique !** Il affiche `root`. Le script a été exécuté avec les droits de son propriétaire (`root`), pas avec les vôtres. C'est une élévation de privilèges temporaire et contrôlée.
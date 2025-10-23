`SUID` (**S**et **U**ser **ID**) est une permission spéciale qui permet à un programme de s'exécuter avec les droits de son **propriétaire**, et non de celui qui le lance.

**Important :** Pour des raisons de sécurité, le SUID est **ignoré sur les scripts** (`#!/bin/bash`). Il ne fonctionne que sur les **programmes binaires compilés**.

Pour le démontrer, un petit programme C `suid_prog` a été compilé pour vous. Il appartient à `root` et affiche votre "Effective User ID" (EUID), qui est l'identité utilisée par le processus.

Lançons-le normalement. L'UID de `learner` est 1001, celui de `root` est 0.

`./suid_prog`{{execute}}

Il affiche votre UID (1001) et votre EUID (1001). Normal. Maintenant, activons le bit SUID. En symbolique, c'est `u+s`.

`sudo chmod u+s suid_prog`{{execute}}

Regardez les permissions. Le `x` du propriétaire est devenu un `s`, et le fichier est surligné en rouge pour indiquer un danger potentiel.

`ls -l suid_prog`{{execute}}

Maintenant, ré-exécutez le programme.

`./suid_prog`{{execute}}

**Magique !** Votre UID est toujours 1001, mais votre **EUID est 0 (root)**. Le programme s'est exécuté avec les droits de son propriétaire (`root`). C'est le mécanisme qui permet à la commande `passwd` de fonctionner !
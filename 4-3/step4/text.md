Pourquoi pouvez-vous taper `ls` et pas `/bin/ls` ? Comment le shell trouve-t-il les commandes ? Grâce à la variable d'environnement `$PATH`.

C'est une liste de dossiers où le shell cherche les exécutables. Affichons-la.

`echo $PATH`{{execute}}

La commande `which` vous montre le chemin exact de la commande qui sera exécutée en se basant sur le `$PATH`.

`which ls`{{execute}}

---

### Le piège du script local

Un script `mon_script.sh` a été créé pour vous. Il est même exécutable.

`ls -l mon_script.sh`{{execute}}

Essayons de l'exécuter comme une commande normale.

`mon_script.sh`{{execute}}

**"Command not found" !** Pourquoi ? Parce que le répertoire actuel (`.`) n'est **pas** dans le `$PATH` par défaut (pour des raisons de sécurité).

Pour exécuter un script dans le répertoire courant, vous devez le préciser avec un chemin relatif : `./`.

`./mon_script.sh`{{execute}}

Succès ! Le `./` dit explicitement au shell : "Exécute le fichier qui se trouve juste ici, dans ce dossier." C'est une des leçons les plus importantes de la ligne de commande.
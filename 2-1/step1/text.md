Le "terminal" n'est pas ce qui exécute vos commandes. C'est un programme appelé **shell** (coquille) qui joue le rôle d'interprète. Le plus courant est **Bash** (Bourne Again SHell).

### Quel est votre shell ?

Il existe plusieurs façons de le savoir. La plus simple est d'utiliser la variable d'environnement `$SHELL`.

`echo $SHELL`{{execute}}

Le résultat, `/bin/bash`, vous confirme que vous utilisez bien Bash.

### Quels autres shells sont disponibles ?

Votre système connaît plusieurs types de shells. Vous pouvez les lister en lisant le fichier `/etc/shells`.

`cat /etc/shells`{{execute}}

Vous voyez `sh` (l'ancêtre), `bash` (le standard), `dash` (un shell minimaliste), et peut-être `zsh` ou `fish` sur d'autres systèmes.

### Changer de shell (temporairement)

Vous pouvez lancer un autre shell à l'intérieur de votre shell actuel. Lançons `sh`, l'ancêtre de Bash.

`sh`{{execute}}

Votre prompt a peut-être changé ! Vous êtes maintenant dans un shell `sh`. Pour revenir à Bash, tapez simplement `exit`.

`exit`{{execute}}

Vous êtes de retour dans votre shell Bash familier.
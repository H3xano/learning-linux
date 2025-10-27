### Créer une variable pour un chemin

Imaginons que vous travaillez souvent dans le dossier des logs système, `/var/log`. Créons une variable `$LOG_DIR` pour y accéder rapidement.

`echo 'export LOG_DIR="/var/log"' >> ~/.bashrc`{{execute}}
`source ~/.bashrc`{{execute}}

Maintenant, vous pouvez lister le contenu de ce dossier depuis n'importe où.

`ls $LOG_DIR`{{execute}}

---
### Modifier la variable `PATH` (crucial !)

La variable `$PATH` dit au shell où chercher les commandes. Nous allons y ajouter un dossier personnel `~/bin` pour y mettre nos propres scripts.

D'abord, créons ce dossier.

`mkdir -p ~/bin`{{execute}}

Ajoutons-le au **début** de la variable `PATH` dans notre `.bashrc`.

`echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc`{{execute}}
`source ~/.bashrc`{{execute}}

Pour tester, créons un mini-script "hello" dans ce dossier.

`echo '#!/bin/bash' > ~/bin/hello`{{execute}}
`echo 'echo "Bonjour depuis mon script !"' >> ~/bin/hello`{{execute}}

Rendons-le exécutable.

`chmod +x ~/bin/hello`{{execute}}

Maintenant, déplacez-vous ailleurs et lancez votre script comme une vraie commande !

`cd /tmp`{{execute}}
`hello`{{execute}}

Votre shell trouve et exécute maintenant vos scripts personnels, où que vous soyez. C'est une compétence fondamentale.
L'un des plus grands avantages de `sudo` est la **traçabilité**. Chaque commande exécutée avec `sudo` est enregistrée dans un journal.

Le fichier de log principal pour cela est `/var/log/auth.log`.

Utilisons `sudo` pour lister le contenu de `/root`.

`sudo ls -l /root`{{execute}}

Maintenant, jouons les détectives et cherchons la trace de cette commande dans les logs. Nous allons utiliser `grep` pour filtrer les lignes contenant "sudo".

`sudo grep "sudo" /var/log/auth.log | tail -n 5`{{execute}}

Vous devriez voir une ligne qui ressemble à ceci :
`Oct 21 12:00:00 ubuntu sudo:  learner : TTY=pts/0 ; PWD=/home/learner ; USER=root ; COMMAND=/usr/bin/ls -l /root`

Cette ligne est une preuve infalsifiable qui dit :
-   **Qui :** `learner`
-   **Quand :** `Oct 21 12:00:00`
-   **Où :** `TTY=pts/0` et `PWD=/home/learner`
-   **Quoi :** `COMMAND=/usr/bin/ls -l /root`

---
### Le fichier de configuration `sudoers`

La configuration de `sudo` se trouve dans `/etc/sudoers`. **NE L'ÉDITEZ JAMAIS DIRECTEMENT !** Utilisez toujours la commande `visudo`, qui vérifie la syntaxe avant d'enregistrer.

Inspectons le fichier de configuration de manière sûre (en lecture seule).

`sudo cat /etc/sudoers`{{execute}}

Repérez cette ligne :
`%sudo   ALL=(ALL:ALL) ALL`

Elle signifie : "Tout membre (`%`) du groupe `sudo` peut exécuter (`ALL`) n'importe quelle commande (`ALL`) sur n'importe quelle machine (`ALL`) en tant que n'importe quel utilisateur (`(ALL:ALL)`)".
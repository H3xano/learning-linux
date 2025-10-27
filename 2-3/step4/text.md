L'un des plus grands avantages de `sudo` est la **traçabilité**. Chaque commande exécutée est enregistrée dans un journal, créant une piste d'audit infalsifiable.

Le fichier de log principal pour cela est `/var/log/auth.log`.

### Laisser une Trace
Exécutons une commande simple pour qu'elle soit enregistrée dans le journal.

`sudo ls -l /root`{{execute}}
*Mot de passe :* `killercoda`

### Mener l'Enquête
Maintenant, jouons les détectives et cherchons la trace de cette commande dans les logs. Nous allons utiliser `grep` pour filtrer les lignes contenant "sudo" et `tail` pour voir les plus récentes.

`sudo grep "sudo" /var/log/auth.log | tail -n 5`{{execute}}

Vous devriez voir une ligne qui ressemble à ceci :
`Oct 21 12:00:00 ubuntu sudo:  learner : TTY=pts/0 ; PWD=/home/learner ; USER=root ; COMMAND=/usr/bin/ls -l /root`

Cette ligne est une preuve qui dit :
-   **Qui :** `learner`
-   **Quand :** `Oct 21 12:00:00`
-   **Où :** `TTY=pts/0` et `PWD=/home/learner`
-   **Quoi :** `COMMAND=/usr/bin/ls -l /root`

Grâce à ces logs, un administrateur peut toujours savoir qui a fait quoi sur le système.
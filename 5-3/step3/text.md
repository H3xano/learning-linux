Un **processus** est un programme en cours d'exécution. La commande `ps` (**p**rocess **s**tatus) est votre scanner pour les voir.

Si vous tapez `ps` tout seul, vous ne verrez que les processus de votre terminal actuel. C'est très limité.

`ps`{{execute}}

---

### `ps aux` : La vue complète

Pour voir **TOUS** les processus qui tournent sur la machine (ceux de tous les utilisateurs, les services système, etc.), on utilise la commande magique `ps aux`.

`ps aux`{{execute}}

La sortie est longue ! C'est le tableau de bord complet de votre système. Les colonnes les plus importantes sont :
-   `USER` : Le propriétaire du processus.
-   `PID` : Le numéro d'identification unique du processus.
-   `%CPU` : Le pourcentage de CPU utilisé.
-   `%MEM` : Le pourcentage de mémoire utilisé.
-   `COMMAND` : La commande qui a lancé le processus.

Cette commande est l'outil n°1 pour diagnostiquer un serveur lent.
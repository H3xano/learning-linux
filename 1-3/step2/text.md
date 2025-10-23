# Étape 2 : Où et Quand suis-je ? (Commandes de Contexte)

Maintenant que vous savez qui vous êtes, demandons au système des informations sur son environnement.

### `date` : L'heure et la date

La commande `date` vous donne la date et l'heure actuelles du serveur, y compris le fuseau horaire (UTC ici).

`date`{{execute}}

### `cal` : Le calendrier

Besoin d'un calendrier ? La commande `cal` est là pour ça.

`cal`{{execute}}

### `uptime` : La santé du serveur

La commande `uptime` est un bulletin de santé rapide du serveur. Elle vous dit :
-   Depuis combien de temps le serveur est allumé (`up`).
-   Combien d'utilisateurs sont connectés.
-   La **charge moyenne** (`load average`), un indicateur clé de sa performance.

`uptime`{{execute}}
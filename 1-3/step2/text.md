Maintenant que vous savez qui vous êtes, demandons au système des informations sur son environnement.

### `date` : L'heure et la date

La commande `date` vous donne la date et l'heure actuelles du serveur, y compris le fuseau horaire (UTC ici).

`date`

La vraie puissance de `date` est dans le formatage. Imaginez que vous vouliez créer un fichier de sauvegarde. Obtenez une date parfaite pour un nom de fichier avec :

`date +'%Y-%m-%d'`

### `cal` : Le calendrier

Besoin d'un calendrier ? La commande `cal` est là pour ça.

`cal`

Planifions un peu ! Affichez le calendrier du mois précédent, du mois en cours et du mois suivant avec la commande `cal -3` :

`cal -3`

### `uptime` : La santé du serveur

La commande `uptime` est un bulletin de santé rapide du serveur. Elle vous dit :
-   Depuis combien de temps le serveur est allumé (`up`).
-   Combien d'utilisateurs sont connectés.
-   La **charge moyenne** (`load average`), un indicateur clé de sa performance.

`uptime`
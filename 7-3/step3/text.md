Les logs sont les yeux et les oreilles de votre serveur. Ils se trouvent dans `/var/log/nginx/`.

### `access.log` : Qui a visité quoi ?

Générons du trafic en visitant la page d'accueil et une page qui n'existe pas.

`curl http://localhost`{{execute}}
`curl http://localhost/page_inexistante`{{execute}}

Suivons le fichier `access.log` en temps réel pour voir ces requêtes apparaître.

`sudo tail -f /var/log/nginx/access.log`{{execute T1}}

Vous voyez les deux lignes correspondantes, l'une avec un code `200` (OK) et l'autre avec `404` (Not Found). Appuyez sur `Ctrl+C` pour arrêter.

---
### `error.log` et analyse avancée

Le fichier `error.log` contient les problèmes. Cherchons les erreurs de type "File not found".

`sudo grep "File not found" /var/log/nginx/error.log`{{execute T2}}

Maintenant, une tâche d'expert : trouver le **top 3 des adresses IP** qui ont visité votre site.

`sudo awk '{print $1}' /var/log/nginx/access.log | sort | uniq -c | sort -rn | head -n 3`{{execute T2}}

Cette commande enchaîne `awk` (pour extraire la 1ère colonne), `sort`, `uniq -c` (pour compter), `sort -rn` (pour trier par nombre) et `head` pour n'afficher que le top.
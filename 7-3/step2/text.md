# Étape 2 : Gestion du Service Web Nginx

Votre application est en place, mais le serveur web (Nginx) ne la sert pas encore. Vous devez piloter le service avec `systemctl`.

### `status` : Vérifier l'état du service

`sudo systemctl status nginx`{{execute}}

Vous devriez voir `active (running)`.

### `restart` et `reload` : Appliquer les changements

Imaginons que vous ayez modifié une configuration.
-   `reload` : Applique les changements sans couper le service (préféré en production).
-   `restart` : Arrête et redémarre complètement le service.

Avant toute chose, un pro **teste toujours** sa configuration avec `nginx -t`.

`sudo nginx -t`{{execute}}

Si la syntaxe est OK, vous pouvez recharger le service en toute sécurité.

`sudo systemctl reload nginx`{{execute}}

---
### `stop` et `start` : Le contrôle total

Pour une maintenance, vous pouvez arrêter complètement le service.

`sudo systemctl stop nginx`{{execute}}

Vérifiez son état maintenant. Il devrait être `inactive (dead)`.
`sudo systemctl status nginx`{{execute}}

Essayez d'accéder au site. `curl http://localhost` devrait échouer.
`curl http://localhost`{{execute}}

Redémarrez le service pour remettre le site en ligne.
`sudo systemctl start nginx`{{execute}}
`curl http://localhost`{{execute}}

Vous maîtrisez maintenant le cycle de vie d'un service web.
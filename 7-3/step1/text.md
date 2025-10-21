# Étape 1 : Déploiement et Configuration Initiale

Votre première mission est de déployer une application web simple. Une archive `mon_app.tar.gz` a été placée dans votre répertoire `home`.

### 1. Extraire et Positionner

D'abord, extrayez l'archive et déplacez son contenu dans le répertoire racine du serveur web, `/var/www/html`.

`tar -xzf mon_app.tar.gz`{{execute}}
`sudo mv mon_app/. /var/www/html/`{{execute}}

---
### 2. Configurer et Sécuriser

L'application a besoin d'un fichier de configuration `.env`. Un modèle `env.example` est fourni. Copiez-le et "remplissez" les secrets.

`sudo cp /var/www/html/env.example /var/www/html/.env`{{execute}}
`sudo nano /var/www/html/.env`{{execute}}
*(Dans nano, changez `__DB_PASSWORD__` par `supersecret123`, puis `Ctrl+O`, Entrée, `Ctrl+X`)*

Maintenant, appliquons les permissions standards pour un site web :
-   Le propriétaire doit être `www-data` (l'utilisateur du serveur web).
-   Les dossiers doivent être en `755`.
-   Les fichiers en `644`.
-   Le fichier `.env` doit être ultra-protégé en `600`.

`sudo chown -R www-data:www-data /var/www/html/`{{execute}}
`sudo find /var/www/html/ -type d -exec chmod 755 {} \;`{{execute}}
`sudo find /var/www/html/ -type f -exec chmod 644 {} \;`{{execute}}
`sudo chmod 600 /var/www/html/.env`{{execute}}

Votre application est déployée ! Vérifions qu'elle fonctionne.
`curl http://localhost`{{execute}}
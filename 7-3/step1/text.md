Votre première mission est de déployer une application web simple de A à Z.

### 1. Transférer l'Application

L'archive `mon_app.tar.gz` se trouve sur votre "machine locale", simulée dans le dossier `/home/learner/local_machine_simulation`. La première étape d'un déploiement est de transférer les fichiers sur le serveur. Utilisez `scp` (Secure Copy) pour copier l'archive vers le répertoire temporaire `/tmp` du serveur.

`scp /home/learner/local_machine_simulation/mon_app.tar.gz learner@localhost:/tmp/`{{execute}}
*(Note : `learner@localhost` simule une connexion à distance sur la machine actuelle.)*

### 2. Extraire et Positionner

Maintenant que l'archive est sur le serveur, décompressez-la dans `/tmp`, puis déplacez son contenu dans le répertoire racine du site web, `/var/www/html`.

`cd /tmp`{{execute}}
`tar -xzf mon_app.tar.gz`{{execute}}
`sudo mv mon_app/* /var/www/html/`{{execute}}

---
### 3. Configurer et Sécuriser

L'application a besoin d'un fichier `.env`. Copiez le modèle `env.example` et "remplissez" le secret.

`sudo cp /var/www/html/env.example /var/www/html/.env`{{execute}}
`sudo nano /var/www/html/.env`{{execute}}
*(Dans nano, changez `__DB_PASSWORD__` par `supersecret123`, puis `Ctrl+O`, Entrée, `Ctrl+X`)*

Appliquez les permissions standards :
-   Propriétaire : `www-data`.
-   Dossiers : `755`.
-   Fichiers : `644`.
-   Fichier `.env` (sensible) : `600`.

`sudo chown -R www-data:www-data /var/www/html/`{{execute}}
`sudo find /var/www/html/ -type d -exec chmod 755 {} \;`{{execute}}
`sudo find /var/www/html/ -type f -exec chmod 644 {} \;`{{execute}}
`sudo chmod 600 /var/www/html/.env`{{execute}}

Votre application est déployée ! Vérifions qu'elle fonctionne.
`curl http://localhost`{{execute}}
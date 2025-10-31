Votre première mission est de déployer une application web simple de A à Z.

### 1. Transférer l'Application

L'archive `mon_app.tar.gz` se trouve sur votre "machine locale", simulée dans le dossier `/home/learner/local_machine_simulation`.

Dans un vrai scénario, pour transférer ce fichier sur votre serveur distant, vous utiliseriez la commande `scp` (Secure Copy) comme ceci :
`scp /chemin/local/mon_app.tar.gz utilisateur@ip_du_serveur:/tmp/`

Pour ce lab, nous allons **simuler ce transfert** en copiant le fichier de notre dossier de simulation vers le répertoire `/tmp` du serveur. C'est la première étape avant de décompresser.

`cp /home/learner/local_machine_simulation/mon_app.tar.gz /tmp/`{{execute}}

### 2. Extraire et Positionner

Maintenant que l'archive est dans `/tmp`, décompressez-la, puis déplacez son contenu dans le répertoire racine du site web, `/var/www/html`.

`cd /tmp`{{execute}}
`tar -xzf mon_app.tar.gz`{{execute}}
`sudo mv mon_app/* /var/www/html/`{{execute}}

---
### 3. Configurer et Sécuriser

L'application a besoin d'un fichier `.env`. Copiez le modèle `env.example` et "remplissez" le secret.

`sudo cp /var/www/html/env.example /var/www/html/.env`{{execute}}
`sudo nano /var/www/html/.env`{{execute}}
*(Dans nano, changez `__DB_PASSWORD__` par `supersecret12d3`, puis `Ctrl+O`, Entrée, `Ctrl+X`)*

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
# Étape 5 : Le Baptême du Feu - Résoudre une Panne

**"Le site est down !"** C'est le moment de prouver vos compétences. Nous allons simuler une panne courante.

### 1. La Panne

Un déploiement a mal tourné et a écrasé les permissions du fichier de configuration `.env`. Exécutez cette commande pour simuler la panne :

`sudo chmod 000 /var/www/html/.env`{{execute}}

Maintenant, essayez d'accéder au site.

`curl http://localhost`{{execute}}

**Erreur 500 !** Le site est en panne. Pas de panique, suivons la méthodologie de diagnostic.

---
### 2. Le Diagnostic

**a) Vérifier le statut du service :**
`sudo systemctl status nginx`{{execute}}
Nginx est `active (running)`. Le problème ne vient donc pas du service lui-même, mais de l'application.

**b) Consulter les logs d'erreur :**
`sudo tail -n 20 /var/log/nginx/error.log`{{execute}}

Vous devriez voir une ligne critique, du genre :
`PHP message: PHP Fatal error: ... failed to open stream: Permission denied in /var/www/html/config.php`

**c) Identifier la cause :**
"Permission denied" sur un fichier de configuration. Vérifions les permissions.
`sudo ls -l /var/www/html/.env`{{execute}}

Bingo ! Les permissions sont `---------` (000). Personne ne peut lire le fichier, pas même le serveur web !

---
### 3. La Correction

Le fichier `.env` doit être lisible par son propriétaire (`www-data`). La permission standard et sécurisée est `600`.

`sudo chmod 600 /var/www/html/.env`{{execute}}

---
### 4. La Validation

Vérifiez à nouveau l'accès au site.

`curl http://localhost`{{execute}}

Le site est de retour en ligne ! Vous avez suivi un processus de diagnostic professionnel pour résoudre une panne en quelques minutes.
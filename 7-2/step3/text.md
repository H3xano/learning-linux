Que s'est-il passé sur le serveur cette nuit ? Les logs sont la "boîte noire" de votre système. Il existe deux manières principales de les consulter.

### La Boîte Noire Moderne : `journalctl`

`journalctl` est l'outil des systèmes Linux modernes. Il enregistre tout et permet un filtrage puissant.
-   `--since` : Pour voir les logs depuis un certain temps.
-   `-p` : Pour filtrer par priorité (ex: `err` pour les erreurs).
-   `-u` : Pour filtrer par service.

Cherchons les erreurs de **tous les services** qui se sont produites dans la **dernière heure**.

`sudo journalctl --since "1 hour ago" -p err`{{execute}}

Si cette commande retourne des lignes, c'est qu'il y a eu des erreurs récemment.

### L'Enquête à l'Ancienne : Les Fichiers de Log Traditionnels

Avant `journalctl`, tous les logs étaient des fichiers texte dans le dossier `/var/log`. Ces outils sont toujours essentiels.

**1. Voir les dernières activités du système :** `tail` affiche la fin d'un fichier. C'est parfait pour voir ce qui vient de se passer.

`sudo tail /var/log/syslog`{{execute}}

**2. Chercher une aiguille dans une botte de foin :** `grep` permet de rechercher des motifs spécifiques. Cherchons les tentatives de connexion échouées.

`sudo grep -i "authentication failure" /var/log/auth.log`{{execute}}

La combinaison `tail`, `grep`, et `less` est le trio gagnant de tout enquêteur système.
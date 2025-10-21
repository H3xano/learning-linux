# Étape 3 : Les Logs - La Boîte Noire du Système

Que s'est-il passé sur le serveur cette nuit ? `journalctl` est la "boîte noire" des systèmes Linux modernes. Il enregistre tout.

### Consulter les logs d'un service

Un service essentiel sur ce système est `sshd` (le serveur SSH). Voyons ses logs.

`journalctl -u sshd.service`{{execute}}

Vous voyez l'historique de toutes les activités SSH.

### Filtrer par temps et par priorité

`journalctl` est très puissant pour filtrer.
-   `--since` : Pour voir les logs depuis un certain temps.
-   `-p` : Pour filtrer par priorité (ex: `err` pour les erreurs).

Cherchons les erreurs de **tous les services** qui se sont produites dans la **dernière heure**.

`journalctl --since "1 hour ago" -p err`{{execute}}

Si cette commande retourne des lignes, c'est qu'il y a eu des erreurs récemment.

### Suivre les logs en direct

L'option `-f` permet de suivre les logs en temps réel, comme `tail -f`.

`journalctl -f`{{execute T1}}

Le terminal va "attendre" et afficher chaque nouvel événement système qui se produit. C'est très utile pour observer le comportement d'une application que vous venez de démarrer. Appuyez sur `Ctrl+C` pour arrêter.
Auditer les succès c'est bien, mais un bon administrateur doit surtout savoir **détecter les échecs** et les tentatives suspectes. Les logs de `sudo` sont votre meilleur système d'alarme.

### Simuler une Alerte de Sécurité
Imaginons que quelqu'un essaie d'utiliser vos privilèges `sudo` sans connaître votre mot de passe. Nous allons simuler cela en entrant volontairement un mot de passe incorrect.

Lancez la commande suivante et entrez n'importe quoi comme mot de passe (par ex. "badpass"). Répétez l'opération 3 fois.

`sudo date`{{execute}}

Après 3 échecs, `sudo` affiche un message d'avertissement clair : `3 incorrect password attempts`. C'est une alerte de sécurité !

### Trouver la Preuve de l'Intrusion
Chaque échec de mot de passe est enregistré dans les logs. En tant qu'administrateur, vous pouvez rechercher ces anomalies.

Cherchons la preuve de notre simulation dans le journal d'authentification :

`sudo grep "authentication failure" /var/log/auth.log | tail -n 3`{{execute}}

Vous verrez clairement les lignes indiquant que l'utilisateur `learner` a échoué à s'authentifier.

Cette simple commande est un outil d'audit extrêmement puissant. La surveillance régulière de ces logs permet de détecter les tentatives de force brute ou les abus de privilèges avant qu'ils ne causent des dommages.
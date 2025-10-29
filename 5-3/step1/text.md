Chaque session Linux est définie par des **variables d'environnement**. C'est l'ADN de votre connexion. La commande `echo` avec un `$` vous permet de les lire.

Découvrons votre identité sur ce système.
-   `$USER` : Votre nom d'utilisateur.
-   `$HOME` : Votre répertoire personnel ("chez vous").
-   `$SHELL` : Le programme que vous utilisez pour interagir (votre shell).

`echo "Je suis $USER, mon répertoire est $HOME et j'utilise $SHELL"`{{execute}}

---

### Voir toutes les variables

Pour voir la liste complète des variables qui définissent votre environnement, utilisez la commande `env`.

`env`{{execute}}

Vous pouvez filtrer cette liste avec `grep` pour trouver une variable spécifique.

`env | grep "LANG"`{{execute}}

---

### Créer une variable temporaire

Parfois, vous devez créer ou modifier une variable. La commande `export` rend une variable disponible à tous les programmes que vous lancerez.

Créons une variable pour notre mission.

`export MISSION="espionnage"`{{execute}}

Vérifions qu'elle existe bien en l'affichant :

`echo "Ma mission actuelle : $MISSION"`{{execute}}

Cette variable n'existe que pour votre session actuelle. Si vous vous déconnectiez, elle disparaîtrait !
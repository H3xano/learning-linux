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

Faites défiler la liste. Vous y retrouverez `$USER`, `$HOME`, `$SHELL`, mais aussi `$PATH` (où chercher les commandes), `$PWD` (où vous êtes) et bien d'autres. C'est la "carte d'identité" complète de votre session.

Vous pouvez aussi filtrer cette liste avec `grep` pour trouver une variable spécifique.

`env | grep "LANG"`{{execute}}
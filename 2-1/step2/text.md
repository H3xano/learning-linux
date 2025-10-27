Chaque session est définie par des **variables d'environnement**. Ce sont des informations que tous les programmes peuvent lire.

### Les variables fondamentales

-   `$USER` : Votre nom d'utilisateur.
-   `$HOME` : Votre répertoire personnel.
-   `$PWD` : Votre répertoire de travail actuel.
-   `$PATH` : La liste des dossiers où le shell cherche les commandes. C'est la plus importante !

Affichons ces informations pour votre session.

`echo "Je suis $USER, mon dossier de base est $HOME et je me trouve actuellement dans $PWD"`{{execute}}

Maintenant, affichons le `$PATH` de manière plus lisible, avec un dossier par ligne.

`echo $PATH | tr ':' '\n'`{{execute}}

Quand vous tapez `ls`, le shell cherche `ls` dans chacun de ces dossiers, dans l'ordre, jusqu'à ce qu'il le trouve.

### Voir toutes les variables

Pour lister **toutes** les variables d'environnement de votre session, utilisez la commande `env`.

`env`{{execute}}

---
### Créer et supprimer une variable

Vous pouvez aussi créer vos propres variables. Pour qu'elle soit visible par d'autres programmes, il faut l'**exporter**.

`export MON_MESSAGE="Linux est fascinant !"`{{execute}}

Vérifions qu'elle a bien été créée :

`echo $MON_MESSAGE`{{execute}}

Pour la supprimer, utilisez la commande `unset`.

`unset MON_MESSAGE`{{execute}}

Maintenant, si vous essayez de l'afficher, elle n'existe plus !

`echo $MON_MESSAGE`{{execute}}
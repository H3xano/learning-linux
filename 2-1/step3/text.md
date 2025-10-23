Tous les shells ne sont pas créés égaux ! Linux fait la différence entre plusieurs types.

### Session *Login* vs *Non-Login*

-   **Login Shell** : Une session où vous vous authentifiez (ex: connexion SSH, console TTY). Elle charge `~/.bash_profile`.
-   **Non-Login Shell** : Une session lancée depuis un environnement déjà connecté (ex: un terminal graphique). Elle charge `~/.bashrc`.

Pour savoir dans quel type de session vous êtes, regardez le nom du processus shell.

`echo $0`{{execute}}

-   Si le résultat est `-bash` (avec un tiret), c'est un **login shell**.
-   Si c'est `bash`, c'est un **non-login shell**.

### Shell *Interactif* vs *Non-Interactif*

-   **Interactif** : Un shell avec un prompt, qui attend vos commandes.
-   **Non-Interactif** : Un shell qui exécute un script et se termine.

Le test le plus simple est de vérifier la variable spéciale `$-`.

`[[ $- == *i* ]] && echo "Cette session est Interactive" || echo "Cette session est Non-Interactive"`{{execute}}

Comme vous pouvez le voir, votre terminal est un shell **non-login** et **interactif**, la configuration la plus courante pour un poste de travail.
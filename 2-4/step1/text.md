### Le Cœur du Réacteur : `.bashrc`

Le comportement de votre shell interactif (comme ce terminal) est défini dans le fichier `.bashrc` de votre répertoire `home`.

Listons tous les fichiers, y compris les cachés, pour le repérer.

`ls -la ~`{{execute}}

Vous le voyez ? C'est ici que nous mettons nos personnalisations pour chaque nouveau terminal. Pour appliquer des changements, on utilise la commande `source` qui recharge le fichier.

`source ~/.bashrc`{{execute}}

---
### La Porte d'Entrée : `.bash_profile`

Il existe un autre fichier crucial : `.bash_profile`. Il n'est lu **qu'une seule fois**, lors d'un "login shell" (par ex: une connexion SSH).

Illustrons cette différence fondamentale. Ajoutons un message de bienvenue dans `.bash_profile`.

`echo 'echo "--- Bienvenue ! .bash_profile a été lu. ---"' >> ~/.bash_profile`{{execute}}

Maintenant, simulons une connexion avec `bash --login`.

`bash --login`{{execute}}

Le message apparaît ! Vous êtes dans un nouveau shell. Quittez-le avec `exit`.

`exit`{{execute}}

Vous êtes de retour dans votre shell initial. Ouvrez un autre shell "normal" (non-login).

`bash`{{execute}}

Le message n'apparaît pas ! C'est la différence clé :
-   `.bash_profile` : Pour les configurations à faire une seule fois (comme le `PATH`).
-   `.bashrc` : Pour les configurations de chaque terminal (alias, prompt).

Quittez ce sous-shell pour continuer.

`exit`{{execute}}
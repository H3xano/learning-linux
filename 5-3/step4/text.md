# Étape 4 : Filtrer les Processus pour y voir clair

La sortie de `ps aux` est souvent trop dense. Le plus souvent, on la combine avec `grep` pour trouver exactement ce qu'on cherche.

### Trouver les processus d'un utilisateur

Cherchons tous les processus qui appartiennent à l'utilisateur `root`.

`ps aux | grep "^root"`{{execute}}

Le `^` au début de `^root` assure que nous ne cherchons que les lignes qui **commencent** par "root", ce qui correspond bien à la colonne `USER`.

### Trouver un programme spécifique

Imaginons que nous voulons voir si un processus `sleep` est en cours d'exécution.

`ps aux | grep "sleep"`{{execute}}

Vous devriez voir deux lignes :
1.  Le processus `sleep infinity` que nous cherchons.
2.  Le processus `grep "sleep"` lui-même ! C'est un effet de bord classique.

Pour obtenir une liste vraiment propre, on peut s'exclure soi-même avec `grep -v "grep"`.

`ps aux | grep "sleep" | grep -v "grep"`{{execute}}

Maintenant, le résultat est parfaitement propre ! Vous venez d'utiliser une chaîne de trois commandes pour une investigation ciblée.
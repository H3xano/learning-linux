### La Limite de l'Utilisateur Normal
En tant qu'utilisateur `learner`, vos pouvoirs sont limités pour protéger le système. Essayez de créer un fichier dans le répertoire de configuration `/etc`.

`touch /etc/test_power`{{execute}}

Échec ! Le message "Permission non accordée" est votre garde-fou.

### Le Pouvoir de l'UID 0
D'où vient le pouvoir absolu ? D'un simple numéro : l'UID 0. Vérifions l'identité de l'utilisateur `root`.

`id root`{{execute}}

La clé est `uid=0(root)`. Le noyau Linux ne vérifie pas le nom, seulement si l'UID est 0.

### Prendre le Trône avec `su -`
La commande traditionnelle pour devenir `root` est `su` (**s**ubstitute **u**ser). Le tiret `-` est crucial car il charge complètement l'environnement de `root`. Le mot de passe de `root` est `killercoda`.

`su -`{{execute}}
*Mot de passe :* `killercoda`

Vérifions votre nouvelle identité et votre environnement :
`whoami`{{execute}}
`pwd`{{execute}}

Vous êtes `root`, dans `/root`. Vous avez maintenant le pouvoir absolu. Vous pouvez lire des fichiers que `learner` ne pouvait pas voir.
`cat /etc/shadow`{{execute}}

C'est un grand pouvoir, mais il est dangereux de rester `root` en permanence. Tapez `exit` pour redevenir un simple mortel.

`exit`{{execute}}
L'utilisateur `root` (UID 0) a tous les droits sur le système. La commande traditionnelle pour devenir `root` est `su` (**s**ubstitute **u**ser).

### Le Piège du `su` simple

Essayons `su` sans argument. Le mot de passe pour cet environnement est `killercoda`.

`su`{{execute}}
*Mot de passe :* `killercoda`

Vous êtes maintenant `root` ! Vérifions.
`whoami`{{execute}}

Mais où sommes-nous ?
`pwd`{{execute}}
`echo $HOME`{{execute}}

Étrange, non ? Vous êtes `root`, mais vous êtes toujours dans le répertoire de `learner`. C'est un environnement hybride et dangereux. Tapez `exit` pour revenir à votre utilisateur.

`exit`{{execute}}

---
### La Bonne Méthode : `su -`

Le tiret `-` est crucial. Il signifie "charge complètement l'environnement de `root`".

`su -`{{execute}}
*Mot de passe :* `killercoda`

Vérifions à nouveau :
`whoami`{{execute}}
`pwd`{{execute}}
`echo $HOME`{{execute}}

Maintenant, tout est cohérent : vous êtes `root` et vous êtes dans son répertoire `/root`. C'est la seule façon correcte d'utiliser `su` pour devenir `root`.

En tant que `root`, vous pouvez tout faire, comme lire un fichier protégé.
`cat /etc/shadow`{{execute}}

Tapez `exit` pour redevenir un utilisateur normal et quitter le mode "Dieu".

`exit`{{execute}}
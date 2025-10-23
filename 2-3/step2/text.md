Utiliser `su -` est dangereux car on reste `root` pour toute la session. La méthode moderne est `sudo`, qui accorde des privilèges pour **une seule commande**.

### La première utilisation de `sudo`

Le fichier `/etc/shadow` est illisible pour un utilisateur normal.

`cat /etc/shadow`{{execute}}

Maintenant, utilisons `sudo` pour lire ce fichier. `sudo` vous demandera **votre propre mot de passe** (`learner`), pas celui de `root`. Pour ce lab, il n'y a pas de mot de passe pour `learner`.

`sudo cat /etc/shadow`{{execute}}

Succès ! Vous avez exécuté `cat` en tant que `root` pour cette seule commande, puis vous êtes immédiatement redevenu `learner`. C'est beaucoup plus sûr.

---
### Les options utiles de `sudo`

La commande `sudo` possède des options très pratiques.

-   `-l` : **l**iste les droits que vous avez avec `sudo`.
`sudo -l`{{execute}}

-   `-k` : **k**ill, invalide le "ticket" `sudo`. Après cette commande, `sudo` vous redemandera votre mot de passe.
`sudo -k`{{execute}}

-   `-i` : ouvre un shell **i**nteractif en tant que `root`, de manière propre (équivalent à `sudo su -`).
`sudo -i`{{execute}}

Vous êtes maintenant `root` dans une session propre. Tapez `exit` pour revenir.
`exit`{{execute}}
Utiliser `su -` est dangereux car on reste `root` pour toute la session. La méthode moderne est `sudo`, qui accorde des privilèges pour **une seule commande**.

### L'Élévation Ponctuelle
Le fichier `/etc/shadow` est illisible pour vous. Tentons de le lire avec `sudo`. `sudo` vous demande **votre propre mot de passe** (`killercoda`).

`sudo cat /etc/shadow`{{execute}}
*Mot de passe :* `killercoda`

Succès ! Vous avez exécuté `cat` en tant que `root` pour cette seule commande, puis vous êtes immédiatement redevenu `learner`. C'est beaucoup plus sûr.

### Le Piège de la Redirection
Attention, `sudo` ne s'applique qu'à la commande, pas aux opérateurs de shell comme `>`. Cette commande échouera :

`sudo echo "127.0.0.1 test" > /etc/hosts`{{execute}}

La redirection `>` est exécutée par *votre* shell (qui n'a pas les droits). La bonne méthode est d'utiliser un "tuyau" (`|`) et la commande `tee`.

`echo "127.0.0.1 test-tee" | sudo tee -a /etc/hosts`{{execute}}

### Options Utiles de `sudo`
- `-l` : **l**iste vos droits.
`sudo -l`{{execute}}

- `-i` : ouvre un shell **i**nteractif en tant que `root` (équivalent propre à `su -`).
`sudo -i`{{execute}}
`whoami`{{execute}}
`exit`{{execute}}

- `-u` : exécute une commande en tant qu'un **u**tilisateur autre que `root`.
`sudo -u root whoami`{{execute}}
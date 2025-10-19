# Étape 1 : Se repérer avec `pwd` et se déplacer avec `cd`

La première règle de la navigation est de savoir où l'on est. La commande `pwd` (**p**rint **w**orking **d**irectory) est votre GPS.

Tapez-la pour connaître votre position actuelle.

`pwd`{{execute}}

Vous êtes dans `/home/learner`, le répertoire "home" de votre utilisateur. C'est un **chemin absolu**, car il commence par la racine `/`.

---

### Se déplacer avec `cd`

La commande `cd` (**c**hange **d**irectory) est votre téléporteur. Utilisons un chemin absolu pour nous déplacer dans le dossier `/etc`, le centre de configuration du système.

`cd /etc`{{execute}}

Maintenant, vérifiez votre nouvelle position avec `pwd`.

`pwd`{{execute}}

Vous êtes bien dans `/etc`. Les chemins absolus fonctionnent depuis n'importe où, car ils donnent l'adresse complète depuis la racine.
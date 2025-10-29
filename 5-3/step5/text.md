Trier c'est bien, mais parfois on veut juste **filtrer** pour trouver un processus spécifique ou voir ce que fait un utilisateur.

### Méthode 1 : Filtrer avec `grep` (la plus courante)

Imaginons que nous voulons voir si un processus `sleep` est en cours. On combine `ps aux` avec `grep`.

`ps aux | grep "sleep"`{{execute}}

Vous voyez le processus `sleep infinity` et aussi... le processus `grep "sleep"` ! Pour nettoyer la sortie, on peut ajouter un deuxième `grep` pour l'exclure.

`ps aux | grep "sleep" | grep -v "grep"`{{execute}}

C'est une technique très répandue mais un peu lourde.

---

### Méthode 2 : Filtrage natif de `ps` (plus propre)

`ps` a ses propres options de filtrage. Pour voir tous les processus de l'utilisateur `root` :

`ps -u root`{{execute}}

C'est plus court et plus propre, car il n'y a pas de processus `grep` parasite dans la sortie !

---

### Une autre vue : `ps -ef` et la hiérarchie

Il existe une autre syntaxe très populaire pour `ps`. Elle met en avant la hiérarchie des processus.

`ps -ef`{{execute}}

Remarquez la colonne `PPID` (**P**arent **P**rocess **ID**). Chaque processus a un "parent" qui l'a lancé. C'est crucial pour comprendre les dépendances dans le système. Par exemple, le parent de la commande `ps -ef` que vous venez de taper est votre shell `bash`.
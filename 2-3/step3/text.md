Vous avez le pouvoir d'exécuter certaines commandes, mais comment l'étendre ? En modifiant le fichier de configuration de `sudo`.

### La Règle d'Or : `visudo`
On ne modifie **JAMAIS** le fichier `/etc/sudoers` directement. Une erreur de syntaxe pourrait vous bloquer hors de votre système ! On utilise **TOUJOURS** la commande `visudo`, qui vérifie la syntaxe avant de sauvegarder.

### L'Approche Moderne : `/etc/sudoers.d`
Pour garder la configuration propre, nous allons ajouter nos règles dans un fichier séparé dans le répertoire `/etc/sudoers.d`.

Ouvrons un nouveau fichier de configuration avec `visudo` :

`sudo visudo -f /etc/sudoers.d/learner-privileges`{{execute}}

L'éditeur `nano` va s'ouvrir.

### Accorder un Nouveau Pouvoir
Ajoutez la ligne suivante à la fin du fichier. Cette règle vous permettra de mettre à jour la liste des paquets système (`apt update`) sans avoir à taper votre mot de passe.

```bash
learner ALL=(ALL) NOPASSWD: /usr/bin/apt update
```

- `learner` : L'utilisateur concerné.
- `ALL=` : Sur n'importe quelle machine.
- `(ALL)` : En tant que n'importe quel utilisateur.
- `NOPASSWD:` : Ne pas demander de mot de passe.
- `/usr/bin/apt update` : Pour cette commande exacte.

Pour sauvegarder dans `nano` :
1.  Appuyez sur `Ctrl+X`.
2.  Appuyez sur `Y` (pour Yes).
3.  Appuyez sur `Enter` pour confirmer le nom du fichier.

### Tester le Nouveau Privilège
Maintenant, testons notre nouvelle règle.

`sudo apt update`{{execute}}

Ça fonctionne, et sans demander de mot de passe ! Mais essayons une autre commande `apt` non couverte par notre règle.

`sudo apt install -y vim`{{execute}}

Cette fois, `sudo` vous demande votre mot de passe, car seule la commande `apt update` a été autorisée sans mot de passe. Vous êtes devenu un véritable architecte des privilèges !
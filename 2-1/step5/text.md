Votre identité numérique ne se limite pas à votre nom. Explorons quelques autres caractéristiques de votre profil utilisateur.

### Votre Langue et Culture : `locale`

Votre système est configuré pour une langue et une région spécifiques, ce qui affecte l'affichage des dates, des nombres et des messages. La commande `locale` vous donne ces informations.

`locale | grep LANG`{{execute}}

Le résultat `fr_FR.UTF-8` indique une configuration pour le Français (fr), la France (FR), avec l'encodage de caractères standard (UTF-8).

### Votre Numéro d'Identification : PID

Chaque programme qui s'exécute sur Linux, y compris votre shell, possède un identifiant de processus unique, ou **PID**. Vous pouvez connaître le PID de votre shell actuel avec la variable spéciale `$$`.

`echo "Le PID de mon shell est $$"`{{execute}}

### Vos Outils par Défaut : `$EDITOR`

De nombreux programmes (comme `git` ou `crontab`) ont besoin d'ouvrir un éditeur de texte. Ils regardent la variable `$EDITOR` pour savoir lequel utiliser. Vérifions si elle est définie.

`echo "Mon éditeur par défaut est : $EDITOR"`{{execute}}

Si elle est vide, aucun éditeur par défaut n'est configuré. La définir est une étape de personnalisation courante.
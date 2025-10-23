Le comportement de votre shell est défini dans des fichiers cachés dans votre répertoire `home`. Le plus important pour les sessions interactives (comme ce terminal) est `.bashrc`.

Listons tous les fichiers de votre `home`, y compris les fichiers cachés, pour le repérer.

`ls -la ~`{{execute}}

Vous voyez le fichier `.bashrc`. C'est ici que nous allons mettre toutes nos personnalisations.

Ouvrons-le avec `nano` pour l'explorer.

`nano ~/.bashrc`{{execute T1}}

Faites défiler le fichier (avec les flèches ou `Page Down`). Vous verrez qu'il contient déjà des configurations par défaut. **Ne modifiez rien pour l'instant**.

L'une des commandes les plus importantes pour appliquer des changements est `source`. Elle recharge un fichier de configuration dans la session actuelle sans avoir à se déconnecter.

Pour recharger notre configuration (même si nous n'avons rien changé), tapez :

`source ~/.bashrc`{{execute T2}}

Vous savez maintenant où se trouve le "cerveau" de votre shell et comment le "rafraîchir".
# 🧩 Étape 1 – Identifier son shell et son environnement

Avant de plonger dans le diagnostic, découvrons **qui vous êtes** et **où vous êtes** dans le monde Linux.

```bash
echo $SHELL
````

👉 Vous découvrez le **programme shell** que vous utilisez (souvent `/bin/bash`).

```bash
ps -p $$
```

👉 Cette commande montre le **processus courant** du shell.
Elle confirme son nom exact et son PID.

Pour plus de contexte :

```bash
echo "Shell courant : $0"
echo "Utilisateur : $USER"
echo "Répertoire personnel : $HOME"
```

Vous venez d’identifier votre **environnement d’exécution**. C’est la base de tout bon diagnostic Linux. 🔍
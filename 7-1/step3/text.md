# Étape 3 : Gérer les Paramètres

Un script devient vraiment utile quand il peut accepter des **paramètres** à l'exécution.
-   `$1` : contient le premier paramètre.
-   `$2` : contient le deuxième paramètre.
-   `$#` : contient le nombre de paramètres passés.

Créons un script qui salue la personne de notre choix.

`nano script_params.sh`{{execute}}

Écrivez ce code :
```bash
#!/bin/bash

# $1 est le premier argument passé au script
PRENOM=$1

echo "Bonjour, $PRENOM !"
echo "Vous avez passé $# paramètre(s)."
```
Sauvegardez et quittez. Rendez le script exécutable.

`chmod +x script_params.sh`{{execute}}

Maintenant, exécutez-le en lui passant un prénom comme paramètre.

`./script_params.sh Formip`{{execute}}

---
### Valeurs par défaut

Que se passe-t-il si aucun paramètre n'est donné ? On peut le gérer avec `${1:-"valeur_defaut"}`.

Modifions notre script.
`nano script_params.sh`{{execute}}

Changez la ligne `PRENOM=$1` en :
```bash
PRENOM=${1:-"Visiteur"}
```
Sauvegardez et quittez. Maintenant, lancez le script **sans** paramètre.

`./script_params.sh`{{execute}}

Le script a intelligemment utilisé la valeur par défaut !
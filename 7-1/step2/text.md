# Étape 2 : Maîtriser les Variables

Une variable est une "boîte" nommée pour stocker une information.
-   Déclaration : `NOM="valeur"` (sans espaces autour du `=`).
-   Lecture : `$NOM`.

Créons un script qui utilise des variables pour être plus lisible et facile à modifier.

`nano script_variables.sh`{{execute}}

Écrivez ce code dans `nano` :
```bash
#!/bin/bash

# Déclaration des variables
UTILISATEUR="Alice"
DOSSIER_CIBLE="/tmp/rapports"

echo "Préparation du rapport pour $UTILISATEUR..."

# Création du dossier
mkdir -p "$DOSSIER_CIBLE"

echo "Le rapport sera sauvegardé dans $DOSSIER_CIBLE"
```
Sauvegardez (`Ctrl+O`, Entrée) et quittez (`Ctrl+X`).

---
### Utiliser une commande dans une variable

On peut stocker le résultat d'une commande dans une variable avec `$(commande)`.

Modifions notre script pour inclure la date.
`nano script_variables.sh`{{execute}}

Ajoutez ces lignes à la fin :
```bash
DATE_JOUR=$(date +%Y-%m-%d)
echo "Date du rapport : $DATE_JOUR"
```
Sauvegardez et quittez. Maintenant, rendez le script exécutable et lancez-le.

`chmod +x script_variables.sh`{{execute}}
`./script_variables.sh`{{execute}}
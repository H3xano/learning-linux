Un script intelligent doit pouvoir prendre des décisions. La structure `if [ condition ]; then ... fi` est faite pour ça.

Créons un script qui vérifie si un fichier existe.

`nano script_condition.sh`{{execute}}

Écrivez ce code :
```bash
#!/bin/bash

FICHIER=$1

echo "Vérification de l'existence de : $FICHIER"

# Le test '-f' vérifie si c'est un fichier
if [ -f "$FICHIER" ]; then
    echo "✅  Le fichier existe."
else
    echo "❌  Le fichier n'existe PAS."
fi
```
Sauvegardez et quittez. Rendez-le exécutable.

`chmod +x script_condition.sh`{{execute}}

---
### Tester le script

D'abord, testons avec un fichier qui existe, comme `/etc/hostname`.

`./script_condition.sh /etc/hostname`{{execute}}

Maintenant, avec un fichier qui n'existe pas.

`./script_condition.sh /un/fichier/inexistant`{{execute}}

Le script a bien pris deux décisions différentes selon la situation.

### Test numérique

On peut aussi tester des nombres.
-   `-eq` : égal
-   `-gt` : plus grand que (**g**reater **t**han)
-   `-lt` : plus petit que (**l**ess **t**han)

Ajoutons un test sur le nombre d'arguments à notre script.
`nano script_condition.sh`{{execute}}

Ajoutez ces lignes au tout début, juste après le `#!/bin/bash` :
```bash
# Vérifie si exactement 1 paramètre a été donné
if [ "$#" -ne 1 ]; then
    echo "Erreur : vous devez fournir exactement un nom de fichier en paramètre."
    exit 1
fi
```
Sauvegardez et quittez. `exit 1` arrête le script en cas d'erreur.
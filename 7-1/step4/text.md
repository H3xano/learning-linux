Un script intelligent prend des décisions avec `if [ condition ]; then ... fi`.

Créons un script qui vérifie si un fichier existe **ET** s'il est lisible.

`nano script_condition.sh`{{execute}}

Écrivez ce code. L'opérateur `&&` signifie "ET".
```bash
#!/bin/bash

# Vérifie si exactement 1 paramètre a été donné
if [ "$#" -ne 1 ]; then
    echo "Erreur : vous devez fournir exactement un nom de fichier."
    exit 1
fi

FICHIER=$1

echo "Vérification de : $FICHIER"

# Le test '-f' vérifie si c'est un fichier
# Le test '-r' vérifie si le fichier est lisible (read)
if [ -f "$FICHIER" ] && [ -r "$FICHIER" ]; then
    echo "✅  Le fichier existe et est lisible."
    echo "Nombre de lignes : $(wc -l < "$FICHIER")"
else
    echo "❌  Le fichier n'existe PAS ou est illisible."
fi
```
Sauvegardez et quittez. Rendez-le exécutable.

`chmod +x script_condition.sh`{{execute}}

---
### Tester le script

Testons avec un fichier qui existe et est lisible, comme `/etc/hostname`.

`./script_condition.sh /etc/hostname`{{execute}}

Maintenant, avec un fichier qui n'existe pas.

`./script_condition.sh /un/fichier/inexistant`{{execute}}

Et enfin, sans argument pour tester notre première condition.

`./script_condition.sh`{{execute}}

Le script gère maintenant plusieurs cas de figure. C'est ça, l'intelligence !
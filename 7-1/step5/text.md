Les boucles permettent d'exécuter la même action sur une liste d'éléments. La boucle `for` est la plus commune.

### Boucle `for` sur une liste

Créons un script qui parcourt une liste de serveurs et simule un "ping".

`nano script_boucle.sh`{{execute}}

Écrivez ce code :
```bash
#!/bin/bash

SERVEURS="serveur_web serveur_db serveur_cache"

echo "Vérification des serveurs..."

for srv in $SERVEURS; do
    echo "Ping du serveur : $srv ... OK"
    sleep 1
done

echo "Vérification terminée."
```
Sauvegardez, quittez, rendez exécutable et lancez.

`chmod +x script_boucle.sh`{{execute}}
`./script_boucle.sh`{{execute}}

---
### Boucle `for` sur des fichiers

La vraie puissance de `for` est de pouvoir travailler sur des fichiers. Le `*` est un joker qui signifie "tous les fichiers".

Créons quelques fichiers d'exemple.
`touch fichier1.log fichier2.log image.jpg`{{execute}}

Maintenant, créons un script qui renomme tous les fichiers `.log` en y ajoutant `.old`.

`nano script_rename.sh`{{execute}}

Écrivez ce code :
```bash
#!/bin/bash

echo "Archivage des anciens logs..."

for fichier in *.log; do
    echo "Renommage de $fichier en ${fichier}.old"
    mv "$fichier" "${fichier}.old"
done

echo "Terminé."
```
Sauvegardez, quittez, rendez exécutable et lancez.

`chmod +x script_rename.sh`{{execute}}
`./script_rename.sh`{{execute}}

Vérifiez le résultat avec `ls`.

`ls`{{execute}}

Les fichiers ont bien été renommés ! Vous venez d'automatiser une tâche répétitive.
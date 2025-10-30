La boucle `for` exécute la même action sur une liste d'éléments. C'est le cœur de l'automatisation de masse.

### Boucle `for` sur des fichiers

La vraie puissance de `for` est de travailler sur des fichiers. Le `*` est un joker qui signifie "tous les fichiers".

Créons quelques fichiers d'exemple.
`touch fichier1.log fichier2.log config.log.lock image.jpg`{{execute}}

Maintenant, créons un script qui renomme tous les fichiers `.log` en y ajoutant `.old`, **sauf** les fichiers `.lock` qu'il doit ignorer.

`nano script_rename.sh`{{execute}}

Écrivez ce code. `continue` permet de passer à l'élément suivant de la boucle.
```bash
#!/bin/bash

echo "Archivage des anciens logs..."

for fichier in *; do
    # Si le nom du fichier se termine par .lock, on l'ignore
    if [[ "$fichier" == *.lock ]]; then
        echo "Ignoré (fichier lock) : $fichier"
        continue
    fi

    # Si le nom du fichier se termine par .log, on le renomme
    if [[ "$fichier" == *.log ]]; then
        echo "Renommage de $fichier en ${fichier}.old"
        mv "$fichier" "${fichier}.old"
    fi
done

echo "Terminé."
```
Sauvegardez, quittez, rendez exécutable et lancez.

`chmod +x script_rename.sh`{{execute}}
`./script_rename.sh`{{execute}}

Vérifiez le résultat avec `ls`.

`ls`{{execute}}

Les fichiers `.log` ont été renommés, mais le fichier `.lock` est intact. Votre automate est maintenant capable de faire des exceptions !
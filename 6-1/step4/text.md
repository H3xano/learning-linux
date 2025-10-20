# Étape 4 : La Vue de l'Expert - `stat`

La commande `ls -l` est un bon résumé, mais `stat` est le rapport complet. Elle affiche toutes les métadonnées d'un fichier, y compris les permissions en double format.

Inspectons notre `rapport.txt`.

`stat rapport.txt`{{execute}}

Regardez la ligne `Access`. Vous y voyez **`(0644/-rw-r--r--)`**. `stat` vous donne les deux notations en même temps, plus besoin de convertir !

Il vous montre aussi les 3 timestamps cruciaux pour l'audit :
-   **Access (`atime`)** : Dernière lecture.
-   **Modify (`mtime`)** : Dernière modification du *contenu*.
-   **Change (`ctime`)** : Dernière modification des *métadonnées*.

Changeons les permissions du fichier et observons.

`chmod 777 rapport.txt`{{execute}}
`stat rapport.txt`{{execute}}

La date **`Change` (ctime) a été mise à jour**, mais la date `Modify` (mtime) n'a pas bougé car le contenu du fichier est resté le même !
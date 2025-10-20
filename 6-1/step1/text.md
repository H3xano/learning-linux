# Étape 1 : Les Bases Visuelles - `ls -l` et les Types de Fichiers

La commande `ls -l` est notre principal outil pour voir les permissions. Des fichiers d'exemple ont été créés pour vous.

`ls -l`{{execute}}

Concentrons-nous sur les 10 premiers caractères, par exemple `-rw-r--r--`.

Le **1er caractère** est le **type de fichier** :
-   `-` : Fichier régulier (un document).
-   `d` : **D**irectory (un dossier).
-   `l` : **L**ink (un lien symbolique/raccourci).

Les **9 caractères suivants** sont les permissions, réparties en 3 groupes : **Propriétaire** (Owner), **Groupe** (Group), et **Tous les autres** (Others).

`_` `rwx` `rwx` `rwx`
`T` `Own` `Grp` `Oth`

Regardez la sortie de `ls -l` :
-   `rapport.txt` commence par `-` (fichier).
-   `projet/` commence par `d` (dossier).
-   `config_link` commence par `l` (lien).
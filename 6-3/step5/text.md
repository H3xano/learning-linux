# Étape 5 : `umask` - La Sécurité par Défaut

D'où viennent les permissions par défaut d'un nouveau fichier ? De `umask`. `umask` est un "masque" qui **retire** des permissions aux valeurs maximales.

-   Valeur max pour un fichier : `666` (`rw-rw-rw-`)
-   Valeur max pour un dossier : `777` (`rwxrwxrwx`)

Voyons votre `umask` actuel.

`umask`{{execute}}

Un `umask` de `0002` signifie qu'on retire `--- --- -w-` (la permission d'écriture `2` pour les "autres").
-   Fichier : 666 - 002 = **664** (`rw-rw-r--`)
-   Dossier : 777 - 002 = **775** (`rwxrwxr-x`)

Vérifions en créant un fichier et un dossier.

`touch fichier_defaut.txt`{{execute}}
`mkdir dossier_defaut`{{execute}}
`ls -l fichier_defaut.txt`{{execute}}
`ls -ld dossier_defaut/`{{execute}}

Les permissions correspondent bien à nos calculs !

---
### Changer `umask`

Changeons temporairement notre `umask` pour être plus restrictif. `077` retirera tous les droits au groupe et aux autres.

`umask 077`{{execute}}

Maintenant, créons un nouveau fichier.

`touch fichier_prive.txt`{{execute}}
`ls -l fichier_prive.txt`{{execute}}

Le fichier est créé avec les permissions `rw-------` (600), totalement privé. `umask` est un outil de sécurité proactif fondamental.
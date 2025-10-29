Pour les fichiers, les permissions `rwx` sont simples. Mais pour les **dossiers**, leur signification change et c'est un point crucial à comprendre !

-   `r` (read) : Droit de **lister** le contenu du dossier (`ls`).
-   `w` (write) : Droit de **créer ou supprimer** des fichiers dans le dossier.
-   `x` (e**x**ecute) : Droit d'**entrer** ou de **traverser** le dossier (`cd`).

### Le Piège du `x`

Un dossier spécial, `dossier_interdit`, a été créé sans la permission `x`. Regardons ses droits.

`ls -ld dossier_interdit`{{execute}}

Vous voyez `drw-r--r--`. Il a les droits de lecture (`r`) et d'écriture (`w`) pour le propriétaire, mais pas d'exécution (`x`).

Essayons d'y entrer.

`cd dossier_interdit`{{execute}}

**Permission denied !** C'est la preuve : même avec le droit de lecture (`r`), sans le `x`, un dossier est une forteresse impénétrable. C'est une des règles d'or des permissions Linux.
Commençons par créer la structure de notre projet. `mkdir` crée des répertoires, `touch` crée des fichiers vides ou met à jour leurs timestamps.

### Créer des répertoires

Pour créer un répertoire simple :
`mkdir mon_projet`{{execute}}

Pour créer une hiérarchie complète en une seule fois (par exemple, pour un projet) :
`mkdir -p mon_projet/{src,docs,tests}`{{execute}}

L'option `-p` est magique : elle crée tous les répertoires parents nécessaires !

---

### Créer des fichiers vides

`touch` est parfait pour créer des fichiers vides ou pour mettre à jour la date d'un fichier existant.

`touch mon_projet/README.md`{{execute}}
`touch mon_projet/src/.gitignore`{{execute}}

Vous avez créé un fichier `README.md` dans `mon_projet` et un fichier caché `.gitignore` dans `mon_projet/src`.

Pour voir la structure que nous avons créée :
`ls -R mon_projet`{{execute}}
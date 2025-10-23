La commande `cp` (copy) est votre outil pour faire des copies de fichiers et de répertoires.

### Copier un fichier

Copions notre fichier `README.md` en `README_backup.md`.

`cp mon_projet/README.md mon_projet/README_backup.md`{{execute}}

Vérifions que la copie a bien été faite :
`ls -l mon_projet/README*`{{execute}}

Vous voyez deux fichiers.

---

### Copier un répertoire

Pour copier un répertoire et tout son contenu (récursivement), on utilise l'option `-r`.

`cp -r mon_projet/ mon_projet_copie/`{{execute}}

Maintenant, `mon_projet_copie` est une copie exacte de `mon_projet`.

---

### L'option -i : La sécurité avant tout

Par défaut, `cp` écrase les fichiers sans pitié. Pour éviter de perdre des données accidentellement, utilisez toujours l'option `-i` (interactive), qui demande confirmation.

Créons un nouveau fichier.
`echo "Nouveau contenu" > nouveau_readme.txt`{{execute}}

Maintenant, essayons de copier ce fichier pour **écraser** le `README.md` que nous avons créé dans `mon_projet`. Utilisons l'option `-i` pour le faire en toute sécurité.

`cp -i nouveau_readme.txt mon_projet/README.md`{{execute}}

Comme `mon_projet/README.md` existe déjà, `cp` vous demande la permission de l'écraser. Répondez `y` (pour yes) et appuyez sur **Entrée**. C'est une protection cruciale !
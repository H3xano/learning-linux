La commande `cp` (copy) est votre outil pour dupliquer fichiers et répertoires.

### Copie simple et récursive

1.  Copions notre fichier `README.md` en `NOTES.md`.
    `cp mon_projet/README.md mon_projet/NOTES.md`{{execute}}

2.  Pour copier un répertoire, il faut l'option `-r` (récursive).
    `cp -r mon_projet/ mon_projet_backup/`{{execute}}

Vérifiez que `mon_projet_backup` existe et contient les mêmes fichiers.

---

### La Copie Parfaite : l'option `-a` (Archive)

Une simple copie avec `-r` ne préserve pas tout (comme les permissions d'exécution). Pour une copie **parfaite**, on utilise `-a`. C'est **essentiel pour les sauvegardes** !

1.  Créons un petit script et rendons-le exécutable :
    `echo "#!/bin/bash" > mon_projet/run.sh`{{execute}}
    `chmod +x mon_projet/run.sh`{{execute}}

2.  Regardez ses permissions (il y a des `x` pour "e**x**ecutable") :
    `ls -l mon_projet/run.sh`{{execute}}

3.  Copions ce script de deux manières différentes dans notre backup :
    `cp mon_projet/run.sh mon_projet_backup/run_simple_copie.sh`{{execute}}
    `cp -a mon_projet/run.sh mon_projet_backup/run_copie_parfaite.sh`{{execute}}

4.  **Observez la différence !**
    `ls -l mon_projet_backup/run*.sh`{{execute}}
    La copie simple a perdu ses droits d'exécution, alors que la copie `-a` les a parfaitement conservés. **Retenez : pour une sauvegarde, utilisez toujours `cp -a` !**

---

### La sécurité avant tout : l'option `-i`

Pour éviter d'écraser un fichier par erreur, utilisez l'option `-i` (interactive).

Essayons d'écraser le fichier `NOTES.md` avec le contenu de `README.md` :
`cp -i mon_projet/README.md mon_projet/NOTES.md`{{execute}}

Comme le fichier de destination existe, `cp` vous demande la permission de l'écraser. Répondez `y` (pour yes) et appuyez sur **Entrée**.
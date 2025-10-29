La commande `cp` (copy) est votre outil pour dupliquer fichiers et répertoires.

### Copie simple et récursive

1.  Copions notre fichier `README.md` en `NOTES.md`.
    `cp mon_projet/README.md mon_projet/NOTES.md`{{execute}}

2.  Pour copier un répertoire, il faut l'option `-r` (récursive).
    `cp -r mon_projet/ mon_projet_backup/`{{execute}}

Vérifiez que `mon_projet_backup` existe et contient les mêmes fichiers.

---

### La Copie Parfaite : `cp -a` vs `cp`

Une copie simple ne préserve pas les métadonnées comme la date de modification originale. Pour une copie **parfaite**, on utilise `-a` (archive). C'est **essentiel pour les sauvegardes** ! Démontrons-le avec les timestamps.

1.  D'abord, créons un script. **Attention**, le `!` est un caractère spécial en Bash. Utilisez bien les guillemets simples (`' '`) pour éviter une erreur "event not found".
    `echo '#!/bin/bash' > mon_projet/run.sh`{{execute}}

2.  Vérifions la date de création de notre script :
    `ls -l --full-time mon_projet/run.sh`{{execute}}

3.  Maintenant, attendons quelques secondes pour que l'horloge avance... puis copions le fichier de deux manières :
    `sleep 5`{{execute}}
    `cp mon_projet/run.sh mon_projet_backup/run_simple_copie.sh`{{execute}}
    `cp -a mon_projet/run.sh mon_projet_backup/run_copie_parfaite.sh`{{execute}}

4.  **Observez la différence sur les dates !**
    `ls -l --full-time mon_projet_backup/run*.sh`{{execute}}
    Vous verrez que :
    - La `run_simple_copie.sh` a la date et l'heure actuelles (la date de la copie).
    - La `run_copie_parfaite.sh` a conservé la date et l'heure **originales** du fichier source.
    **Retenez : pour une sauvegarde fidèle, `cp -a` est indispensable car il préserve timestamps, permissions, et plus encore !**

---

### La sécurité avant tout : l'option `-i`

Pour éviter d'écraser un fichier par erreur, utilisez l'option `-i` (interactive).

Essayons d'écraser le fichier `NOTES.md` avec le contenu de `README.md` :
`cp -i mon_projet/README.md mon_projet/NOTES.md`{{execute}}

Comme le fichier de destination existe, `cp` vous demande la permission. Répondez `y` (pour yes) et appuyez sur **Entrée**.
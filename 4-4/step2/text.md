# Étape 2 : Dupliquer avec `cp`

La commande `cp` (copy) est votre outil pour faire des copies de fichiers et de répertoires.

### Copier un fichier

Copions notre fichier `README.md` en `README_backup.md`.

`cp mon_projet/README.md mon_projet/README_backup.md`{{execute}}

Vérifions que la copie a bien été faite :
`ls -l mon_projet/README*`{{execute}}

Vous voyez deux fichiers, avec des dates de modification différentes.

---

### Copier un répertoire

Pour copier un répertoire et tout son contenu (récursivement), on utilise l'option `-r`.

`cp -r mon_projet/ mon_projet_copie/`{{execute}}

Maintenant, `mon_projet_copie` est une copie exacte de `mon_projet`.

---

### Options utiles : Sécurité et détails

-   `-r` : **R**écursif (obligatoire pour les répertoires).
-   `-i` : Demande confirmation avant d'écraser un fichier existant. **Toujours une bonne idée !**
-   `-v` : Affiche ce que `cp` est en train de faire (verbeux).

Essayons de copier `mon_projet_copie` vers `mon_projet` avec ces options :
`cp -riv mon_projet_copie/ mon_projet/`{{execute}}

`cp` va vous demander confirmation pour écraser les fichiers dans `mon_projet` s'ils existent déjà. C'est une sécurité précieuse !
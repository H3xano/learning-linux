# Étape 3 : Réorganiser avec `mv`

La commande `mv` (move) fait deux choses :
1.  **Renommer** un fichier ou un répertoire.
2.  **Déplacer** un fichier ou un répertoire.

C'est la même commande car les deux sont fondamentalement une modification du "chemin" du fichier.

### Renommer

Pour renommer un fichier, on le déplace simplement vers un nouveau nom dans le même répertoire.

Renommons `mon_projet/README_backup.md` en `mon_projet/NOTES.txt`.

`mv mon_projet/README_backup.md mon_projet/NOTES.txt`{{execute}}

Vérifions :
`ls -l mon_projet/`{{execute}}

Vous voyez `NOTES.txt` et plus `README_backup.md`.

---

### Déplacer

Maintenant, déplaçons le répertoire `mon_projet/src` dans `mon_projet/docs`.

`mv mon_projet/src/ mon_projet/docs/`{{execute}}

Vérifions la structure :
`ls -R mon_projet/`{{execute}}

Vous voyez maintenant `src/` à l'intérieur de `docs/`. C'est un déplacement réussi !

### L'option `-i` de `mv`

Comme pour `cp`, `mv` a une option `-i` pour demander confirmation avant d'écraser un fichier existant. C'est une excellente habitude à prendre !

Essayons de déplacer un fichier vers un endroit où un fichier du même nom existe déjà.
`mv mon_projet/NOTES.txt mon_projet/docs/`{{execute}}

Le système vous demandera confirmation. Appuyez sur `n` pour annuler.

Pour écraser sans confirmation (attention !), on utiliserait `mv -f`. Mais il est toujours plus sûr d'utiliser `mv -i`.
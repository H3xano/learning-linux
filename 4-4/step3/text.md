# Étape 3 : Réorganiser avec `mv`

La commande `mv` (move) fait deux choses :
1.  **Renommer** un fichier ou un répertoire.
2.  **Déplacer** un fichier ou un répertoire.

### Renommer

Pour renommer un fichier, on le déplace simplement vers un nouveau nom dans le même répertoire.

Renommons `mon_projet/README_backup.md` en `mon_projet/NOTES.txt`.

`mv mon_projet/README_backup.md mon_projet/NOTES.txt`{{execute}}

Vérifions :
`ls -l mon_projet/`{{execute}}

---

### Déplacer

Maintenant, déplaçons le répertoire `mon_projet/src` dans `mon_projet/docs`.

`mv mon_projet/src/ mon_projet/docs/`{{execute}}

Vérifions la nouvelle structure :
`ls -R mon_projet/`{{execute}}

---

### L'option `-i` : Éviter l'écrasement accidentel

L'option `-i` (**i**nteractive) est une sécurité cruciale qui vous demande confirmation avant d'écraser un fichier.

Pour voir cela en action, créons d'abord un fichier vide dans la destination qui entrera en conflit.
`touch mon_projet/docs/NOTES.txt`{{execute}}

Maintenant, essayons de déplacer le `NOTES.txt` de la racine du projet dans `docs/`, où un fichier du même nom existe déjà. **Utilisez bien l'option `-i` !**

`mv -i mon_projet/NOTES.txt mon_projet/docs/`{{execute}}

Comme un fichier `NOTES.txt` existe déjà à destination, `mv` vous demande confirmation. Répondez `y` (pour yes) et appuyez sur **Entrée** pour l'écraser. C'est la bonne façon de déplacer des fichiers en toute sécurité !
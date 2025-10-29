La commande `mv` (move) fait deux choses : **renommer** et **déplacer**.

### Renommer

Pour renommer un fichier, on le "déplace" vers un nouveau nom dans le même répertoire.

Renommons `mon_projet_backup/NOTES.md` en `mon_projet_backup/OLD_NOTES.md`.
`mv mon_projet_backup/NOTES.md mon_projet_backup/OLD_NOTES.md`{{execute}}

Vérifions :
`ls -l mon_projet_backup/`{{execute}}

---

### Déplacer

Maintenant, déplaçons le répertoire `mon_projet/tests` à l'intérieur de `mon_projet/src`. Pour voir exactement ce qui se passe, utilisons l'option `-v` (verbeux).

`mv -v mon_projet/tests/ mon_projet/src/`{{execute}}

La sortie vous confirme l'opération de renommage/déplacement. Vérifions la nouvelle structure :
`ls -R mon_projet/`{{execute}}

---

### Sécurité : Éviter l'écrasement avec `-i`

Comme pour `cp`, l'option `-i` (interactive) est une sécurité cruciale.

Créons un fichier `README.md` dans `mon_projet/docs` pour créer un conflit.
`touch mon_projet/docs/README.md`{{execute}}

Maintenant, tentons de déplacer le `README.md` de la racine du projet vers `docs/`, où un fichier du même nom existe. **Utilisez bien l'option `-i` !**

`mv -i mon_projet/README.md mon_projet/docs/`{{execute}}

`mv` vous demande confirmation avant d'écraser. Répondez `y` (pour yes) et appuyez sur **Entrée**. C'est la bonne façon de déplacer des fichiers en toute sécurité !
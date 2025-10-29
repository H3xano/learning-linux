Commençons par créer la structure de notre projet. `mkdir` crée des répertoires, `touch` crée des fichiers vides ou met à jour leurs timestamps.

### Créer des répertoires

L'option `-p` est magique : elle crée tous les répertoires parents nécessaires. L'option `-v` (verbeux) nous montre ce qui est créé. Combinons-les :
`mkdir -pv mon_projet/{src,docs,tests}`{{execute}}

---

### Créer des fichiers et les rafraîchir

`touch` est parfait pour créer des fichiers vides.
`touch mon_projet/README.md`{{execute}}
`touch mon_projet/src/.gitignore`{{execute}}

`touch` a aussi un super-pouvoir : s'il est utilisé sur un fichier existant, il met à jour sa date de dernière modification. Observons-le !

1.  Regardez la date du fichier `README.md` :
    `ls -l mon_projet/README.md`{{execute}}

2.  Attendez un instant, puis "touchez" à nouveau le fichier :
    `touch mon_projet/README.md`{{execute}}

3.  Vérifiez à nouveau sa date. Elle a été mise à jour à l'heure actuelle !
    `ls -l mon_projet/README.md`{{execute}}

C'est une technique très utilisée pour déclencher des actions dans des systèmes de build ou des scripts.

Pour finir, voyons la structure que nous avons créée :
`ls -R mon_projet`{{execute}}
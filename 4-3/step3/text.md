La différence entre ces deux types de chemins est la source de nombreuses erreurs pour les débutants.

-   **Chemin Absolu** : Commence par `/`. C'est une adresse GPS, elle fonctionne de n'importe où. Ex: `/home/learner/Documents`.
-   **Chemin Relatif** : Ne commence **pas** par `/`. C'est une indication locale, elle dépend de là où vous êtes. Ex: `Documents`.

Pour cet exercice, des dossiers `A/B` et `mon_dossier` ont été créés dans votre répertoire `home`. Déplaçons-nous dans le sous-dossier `A/B`.

`cd ~/A/B`{{execute}}
`pwd`{{execute}}

---

Maintenant, depuis `/home/learner/A/B`, essayons de lister le contenu de `mon_dossier` en utilisant un chemin relatif.

`ls mon_dossier`{{execute}}

**Échec !** Le système a cherché `/home/learner/A/B/mon_dossier`, qui n'existe pas. Pour que cela fonctionne, il faut utiliser soit un **chemin absolu**, soit le bon **chemin relatif** en remontant avec `..`.

`ls /home/learner/mon_dossier`{{execute}}
`ls ../../mon_dossier`{{execute}}

---
### Le cas des raccourcis (liens symboliques)

Les liens symboliques sont comme des raccourcis. Créons-en un qui pointe vers `mon_dossier`.

`ln -s ~/mon_dossier ~/raccourci`{{execute}}

Maintenant, déplacez-vous dans ce "raccourci" et regardez où votre GPS pense que vous êtes.

`cd ~/raccourci`{{execute}}
`pwd`{{execute}}

Il affiche le chemin du raccourci ! Pour connaître le chemin **réel** et physique, utilisez l'option `-P`.

`pwd -P`{{execute}}

C'est essentiel pour ne pas vous perdre quand vous naviguez dans des environnements avec beaucoup de liens !
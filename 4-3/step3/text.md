# Étape 3 : Chemins Absolus vs Relatifs

La différence entre ces deux types de chemins est la source de nombreuses erreurs pour les débutants.

-   **Chemin Absolu** : Commence par `/`. C'est une adresse GPS, elle fonctionne de n'importe où. Ex: `/home/learner/Documents`.
-   **Chemin Relatif** : Ne commence **pas** par `/`. C'est une indication locale, elle dépend de là où vous êtes. Ex: `Documents`.

Pour cet exercice, des dossiers `A/B` et `mon_dossier` ont été créés dans votre répertoire `home`.

Déplaçons-nous dans le sous-dossier `A/B`.

`cd ~/A/B`{{execute}}
`pwd`{{execute}}

---

Maintenant, depuis `/home/learner/A/B`, essayons de lister le contenu de `mon_dossier` en utilisant un chemin relatif.

`ls mon_dossier`{{execute}}

**Échec !** Le système a cherché `/home/learner/A/B/mon_dossier`, qui n'existe pas.

Pour que cela fonctionne, il faut utiliser soit un **chemin absolu**...

`ls /home/learner/mon_dossier`{{execute}}

...soit le bon **chemin relatif** en remontant avec `..`.

`ls ../../mon_dossier`{{execute}}
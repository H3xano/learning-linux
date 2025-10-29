Savoir ouvrir une page `man`, c'est bien. Savoir y trouver une information précise en 5 secondes, c'est mieux !

Ouvrons à nouveau le manuel de `ls`.

`man ls`{{execute T1}}

### Navigation

Maintenant, au lieu de quitter, essayez ces commandes :
-   **Espace** : Avancer d'une page.
-   **b** : Reculer d'une page (**b**ackward).
-   **G** (majuscule) : Aller à la toute **f**in de la page.
-   **g** (minuscule) : Revenir au tout début.

### Recherche

La recherche est votre super-pouvoir. Pour chercher un mot, tapez `/` suivi de votre recherche.
1.  Tapez `/sort` et appuyez sur **Entrée**. `man` va surligner la première occurrence du mot "sort".
2.  Appuyez sur `n` (**n**ext) pour aller à l'occurrence suivante.
3.  Appuyez sur `N` (majuscule) pour revenir à l'occurrence précédente.

Une fois que vous avez fini d'explorer, quittez avec `q`.

---

### `apropos` et `whatis` : Trouver quand on ne sait pas

Que faire si vous ne connaissez pas le nom de la commande ? `apropos` cherche un mot-clé dans les descriptions de tous les manuels.

Cherchons une commande pour "copier" des fichiers.

`apropos copy`{{execute T2}}

`apropos` vous liste toutes les commandes liées à la copie ! `cp` semble être la bonne.

> **Note de pro :** Si `apropos` ne trouve rien, c'est parfois que sa base de données de recherche est obsolète. Un administrateur utiliserait la commande `sudo mandb` pour la reconstruire. Nous l'avons déjà fait pour vous dans ce lab !

Pour avoir une définition rapide d'une commande, utilisez `whatis`.

`whatis cp`{{execute T2}}

`whatis ls`{{execute T2}}

C'est parfait pour un rappel rapide !

### Défi : Mettez vos compétences à l'épreuve

Trouvez la commande qui permet d'afficher l'espace disque disponible.

`apropos "space usage"`{{execute}}

`df` semble être la bonne réponse !
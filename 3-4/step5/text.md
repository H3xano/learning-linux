Modifier un fichier, c'est bien. Trouver l'information pertinente rapidement, c'est mieux !

Ouvrons à nouveau notre fichier :

`vim nginx.conf.sample`{{execute}}

### Chercher dans Vim

En Mode Normal :
-   `/motif` : Cherche le `motif` vers l'avant.
-   `n` : Va à l'occurrence **n**ext (suivante).
-   `N` : Va à l'occurrence précédente.

**Mission 1 : Trouver une directive**
1.  Tapez `/log` et appuyez sur **Entrée**. Vim saute à la première occurrence.
2.  Appuyez sur `n` pour voir la suivante.

### Remplacer globalement

Voici la commande qui démontre la puissance de Vim. Pour remplacer `ancien` par `nouveau` dans **tout le fichier** :
`:%s/ancien/nouveau/g`

**Mission 2 : Mettre à jour les chemins des logs**
1.  Tapez la commande suivante pour remplacer toutes les occurrences de `nginx` par `webapp` dans les chemins de logs :
    `:%s/nginx/webapp/g`
2.  Appuyez sur **Entrée**. Les deux lignes de log sont modifiées instantanément !
3.  Sauvegardez et quittez avec `:wq`.
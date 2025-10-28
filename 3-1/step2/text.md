`cat` est super pour les petits fichiers, mais pour un fichier de 10 000 lignes, c'est un cauchemar ! Tout défile trop vite.

Pour cela, nous avons `less`. C'est un "paginator" : il affiche le contenu page par page. Nous avons un fichier `long_log.txt` de 200 lignes pour tester.

Essayez d'abord avec `cat` pour voir le problème :

`cat long_log.txt`{{execute}}

Impossible de voir le début, n'est-ce pas ?

---

### `less` à la rescousse !

Maintenant, utilisons `less`. **Attention : `less` est interactif !** Vous devrez utiliser les touches du clavier pour naviguer. N'oubliez pas que vous pouvez toujours en sortir en appuyant sur `q`.

Tapez la commande suivante dans votre terminal :
`less long_log.txt`

Votre terminal est maintenant en mode `less`.

**Votre mission :**
1.  Allez directement à la **fin** du fichier (touche `G`).
2.  Cherchez la "Ligne 50" mais en **remontant** depuis la fin (tapez `?Ligne 50` puis `Entrée`).
3.  Affichez les numéros de ligne (tapez `-N` puis `Entrée`).
4.  Une fois que vous avez exploré, quittez en appuyant sur `q`.

Touches essentielles à retenir :
-   **Espace** : Page suivante
-   **b** : Page précédente (back)
-   **g** / **G** : Aller au début / à la fin
-   **/**`texte` : Chercher vers l'avant
-   **?**`texte` : Chercher vers l'arrière
-   **q** : Quitter

`cat` est super pour les petits fichiers, mais pour un fichier de 10 000 lignes, c'est un cauchemar ! Tout défile trop vite.

Pour cela, nous avons `less`. C'est un "paginator" : il affiche le contenu page par page. Nous avons un fichier `long_log.txt` de 200 lignes pour tester.

Essayez d'abord avec `cat` pour voir le problème :

`cat long_log.txt`{{execute}}

Impossible de voir le début, n'est-ce pas ?

---

### `less` à la rescousse !

Maintenant, utilisons `less`. **Attention : `less` est interactif !** Vous devrez utiliser les touches du clavier pour naviguer. less va prendre le contrôle de votre terminal (votre prompt va disparaître). N'oubliez pas que vous pouvez toujours en sortir en appuyant sur q pour retrouver votre prompt !

Tapez la commande suivante dans votre terminal :
`less long_log.txt`

Votre terminal est maintenant en mode `less`. Voici les touches essentielles :
-   **Espace** : Page suivante
-   **b** : Page précédente (back)
-   **↓** / **↑** : Ligne suivante / précédente
-   **g** : Aller au tout début du fichier
-   **G** : Aller à la toute fin du fichier
-   **/** + `texte` + **Entrée** : Chercher du texte (ex: `/Ligne 150`)
-   **q** : Quitter et revenir au terminal

**Votre mission :** Ouvrez le fichier, allez à la fin avec `G`, remontez au début avec `g`, puis cherchez "Ligne 50". Quand vous avez fini, appuyez sur `q`.
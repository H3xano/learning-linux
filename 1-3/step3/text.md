Le shell se souvient de tout ce que vous tapez. C'est l'historique, votre meilleur ami pour gagner du temps !

### `history` : Voir le passé

La commande `history` affiche la liste de toutes les commandes que vous avez tapées.

`history`{{execute}}

### Les flèches `↑` et `↓` : Le voyage le plus simple

Utilisez les flèches `Haut` (↑) et `Bas` (↓) pour naviguer dans l'historique.

**Mission :** Utilisez la flèche `↑` jusqu'à retrouver la commande `uptime` et appuyez sur **Entrée** pour l'exécuter à nouveau.

---
### Encore plus rapide : `!!`

Pour répéter la TOUTE dernière commande que vous avez tapée, utilisez simplement `!!`. Essayez :

`!!`{{execute}}

### `Ctrl+R` : La recherche inversée

C'est le raccourci des pros ! Appuyez sur `Ctrl+R` et commencez à taper une partie d'une commande (ex: `who`) pour la retrouver instantanément. Appuyez sur **Entrée** pour l'exécuter.

---
### Mission : L'édition de ligne de commande

Pratiquons l'édition comme un pro.
1.  Tapez la phrase suivante **SANS appuyer sur Entrée** :
    `echo "Linux est difficile"`

2.  Maintenant, **corrigez-la sans utiliser la souris ni les flèches** :
    - Appuyez sur `Ctrl+A` pour aller au début.
    - Appuyez sur `Alt+F` trois fois pour placer le curseur avant "difficile".
    - Appuyez sur `Ctrl+K` pour couper la fin de la ligne.
    - Écrivez `puissant !`

3.  Votre ligne devrait maintenant être `echo "Linux est puissant !"`. Appuyez sur **Entrée**.

`echo "Linux est puissant !"`{{execute}}

### `Ctrl+L` : Le raccourci propreté

Pour nettoyer votre écran rapidement, au lieu de taper `clear`, utilisez simplement le raccourci `Ctrl+L`. Essayez-le !
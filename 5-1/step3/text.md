Certains outils, notamment ceux du projet GNU comme `tar`, ont une documentation encore plus riche dans le système `info`. C'est comme un mini-site web dans votre terminal, avec des "liens" entre les pages (appelées "nœuds").

Explorons la documentation `info` de la commande `tar`.

`info tar`{{execute T1}}

### Navigation dans `info`

La navigation est un peu différente. Voici les bases :
-   **Espace** / **Backspace** : Page suivante / précédente.
-   **Tab** : Aller au lien suivant (les liens sont marqués par `*`).
-   **Entrée** : Suivre le lien sur lequel se trouve votre curseur.
-   **u** : Remonter au nœud parent (**u**p).
-   **n** / **p** : Nœud suivant / précédent.
-   **q** : Quitter.

**Votre mission :**
1.  Appuyez sur `Tab` plusieurs fois pour naviguer entre les liens du menu.
2.  Placez votre curseur sur le lien `* Tutorial::` et appuyez sur **Entrée**.
3.  Vous êtes maintenant dans le tutoriel. Lisez un peu.
4.  Appuyez sur `u` pour remonter au menu principal.
5.  Appuyez sur `q` pour quitter.

Vous venez de naviguer dans un document hypertexte en ligne de commande ! `info` est parfait pour apprendre une commande en profondeur, alors que `man` est idéal pour une référence rapide.
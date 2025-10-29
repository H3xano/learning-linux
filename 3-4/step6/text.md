Parfois, on ne veut pas agir sur une ligne entière, mais sur une portion de texte spécifique. C'est le rôle du **Mode Visuel**.

Dernière ouverture du fichier :

`vim nginx.conf.sample`{{execute}}

### Sélectionner avec précision

En Mode Normal :
-   `v` : Active le Mode Visuel par caractère.
-   `V` : Active le Mode Visuel par ligne.

Une fois en Mode Visuel, déplacez-vous pour étendre la sélection, puis appliquez une commande (`d` pour delete, `y` pour yank/copy).

**Votre mission : Nettoyer un commentaire**
1.  Allez à la ligne `# Mettre le nombre de coeurs CPU`.
2.  Placez votre curseur sur le mot `Mettre`.
3.  Appuyez sur `v` pour entrer en Mode Visuel. Le bas de l'écran affiche `-- VISUAL --`.
4.  Appuyez 4 fois sur `w` pour sélectionner `Mettre le nombre de`.
5.  Appuyez sur `d` pour supprimer la sélection. Il ne devrait rester que `# coeurs CPU`.
6.  C'est votre dernière modification ! Sauvegardez et quittez avec `:wq`.

Félicitations, vous avez exploré les concepts fondamentaux qui rendent Vim si puissant !
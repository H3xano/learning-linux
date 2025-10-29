Vous avez modifié le fichier. Mais que se passe-t-il si vous faites une erreur ? Et comment sauvegarder ?

### La commande la plus importante : Annuler

La commande `u` (undo) en Mode Normal est votre meilleure amie.

**Mission 1 : Annuler une erreur**
1.  Assurez-vous d'être en Mode Normal (`Esc`).
2.  Placez votre curseur sur la ligne `user www-data;` et supprimez-la en tapant `dd`. La ligne disparaît !
3.  Pas de panique ! Appuyez simplement sur `u` pour annuler. La ligne réapparaît.

### Les commandes vitales pour quitter

Pour sauvegarder ou quitter, on passe en **Mode Commande** en tapant `:` depuis le Mode Normal.

-   `:w` : (**w**rite) Sauvegarder.
-   `:q` : (**q**uit) Quitter.
-   `:wq` : (**w**rite & **q**uit) Sauvegarder ET quitter.
-   `:q!` : Quitter **sans** sauvegarder (la sortie de secours).

**Mission 2 : Sauvegarder et Quitter**
1.  Tapez `:wq`
2.  Appuyez sur **Entrée**.

Vous avez appris à corriger vos erreurs et à quitter `vim` sereinement. C'est la base de la confiance.
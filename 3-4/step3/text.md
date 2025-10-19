# Étape 3 : Vim (Partie 2) - L'Art de S'échapper

Vous avez modifié le fichier et êtes revenu en **Mode Normal** en appuyant sur `Esc`. Comment sauvegarder et quitter maintenant ?

Pour cela, on utilise le **Mode Commande**, qui s'active en tapant `:` depuis le Mode Normal.

Une ligne de commande apparaît en bas de l'écran.

### Les commandes vitales pour quitter

Voici les commandes que vous taperez après le `:` :
-   `:w` : (**w**rite) Sauvegarder le fichier.
-   `:q` : (**q**uit) Quitter Vim (ne fonctionne que si le fichier n'a pas été modifié).
-   `:wq` : (**w**rite & **q**uit) La combinaison la plus utile : sauvegarder ET quitter.
-   `:q!` : Quitter **sans** sauvegarder. C'est votre porte de sortie d'urgence si vous avez fait une bêtise.

**Votre mission :**
1.  Assurez-vous d'être en Mode Normal (appuyez sur `Esc` par sécurité).
2.  Tapez `:wq`
3.  Appuyez sur **Entrée**.

Et voilà ! Vous avez édité, sauvegardé et quitté `vim` avec succès. C'est le fameux "secret" que tous les débutants cherchent.
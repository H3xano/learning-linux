# Étape 4 : La magie des pipes `|`

Le pipe `|` est un des concepts les plus puissants de Linux. Il **connecte la sortie (stdout) d'une commande à l'entrée (stdin) de la commande suivante**.

Cela permet de créer des chaînes de traitement sans jamais créer de fichier temporaire.

### Filtrer une sortie

Listons tous les processus en cours (`ps aux`) et utilisons un pipe pour envoyer cette longue liste à `grep`, qui ne gardera que les lignes contenant le mot "bash".

`ps aux | grep "bash"`{{execute}}

En une seule ligne, vous avez filtré des centaines de processus pour ne garder que ceux qui vous intéressent.

### Chaîner plusieurs commandes

On peut enchaîner autant de pipes qu'on veut !
1. `history` : Affiche l'historique de vos commandes.
2. `tail -n 10` : Garde les 10 dernières lignes.
3. `wc -l` : Compte le nombre de lignes.

Connectons-les : "Combien de lignes y a-t-il dans les 10 dernières commandes de mon historique ?" (La réponse sera 10, bien sûr !)

`history | tail -n 10 | wc -l`{{execute}}

Vous venez de créer un mini-programme en une seule ligne !
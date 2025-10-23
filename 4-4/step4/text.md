La commande `rm` (**r**e**m**ove) est le bouton "supprimer" de Linux. **ATTENTION : C'est une suppression DÉFINITIVE !** Il n'y a pas de corbeille.

### Supprimer un fichier

Supprimons un fichier que nous n'avons plus besoin.

`touch fichier_a_supprimer.txt`{{execute}}
`rm fichier_a_supprimer.txt`{{execute}}

Le fichier a disparu !

### Supprimer un répertoire

Pour supprimer un répertoire, il faut l'option `-r` (**r**ecursive). **C'est le paramètre le plus dangereux !**

Supprimons le répertoire `mon_projet/docs/src` (qui contient `main.py`).

`rm -r mon_projet/docs/src/`{{execute}}

Vérifions :
`ls mon_projet/docs/`{{execute}}

Le répertoire `src` a disparu.

### La sécurité AVANT TOUT : `-i` et `-I`

Pour éviter les catastrophes, utilisez TOUJOURS `-i` ou `-I`.

-   `-i` : Demande confirmation pour CHAQUE fichier.
-   `-I` : Demande confirmation UNE SEULE FOIS si plus de 3 fichiers sont concernés. **C'est souvent le meilleur compromis.**

Essayons de supprimer plusieurs fichiers avec `-i` :
`touch temp1.txt temp2.txt temp3.txt`{{execute}}
`rm -i *.txt`{{execute}}

Vous devrez confirmer chaque suppression.

Maintenant, avec `-I` :
`touch temp4.txt temp5.txt temp6.txt`{{execute}}
`rm -I *.txt`{{execute}}

Une seule confirmation pour tout le groupe.

---

### Le danger ultime : `rm -rf`

**NE JAMAIS exécuter `rm -rf` sans être ABSOLUMENT CERTAIN de ce que vous faites.**

-   `-r` : Récursif (supprime dossiers et tout leur contenu)
-   `-f` : Force (ignore les erreurs, ne demande JAMAIS de confirmation)

**La combinaison `rm -rf` est une arme de destruction massive.** La commande `rm -rf /` détruirait TOUT votre système de fichiers. Ne la tapez JAMAIS, sauf si vous savez EXACTEMENT ce que vous faites et pourquoi !
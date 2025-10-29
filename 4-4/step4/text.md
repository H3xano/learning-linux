La commande `rm` (**r**e**m**ove) est le bouton "supprimer" de Linux. **ATTENTION : C'est une suppression DÉFINITIVE !** Il n'y a pas de corbeille.

### `rmdir` : La suppression sécurisée de répertoires VIDES

`rmdir` ne supprime un répertoire que s'il est vide. C'est une excellente protection.

1.  Créez un répertoire vide et supprimez-le :
    `mkdir dossier_vide`{{execute}}
    `rmdir dossier_vide`{{execute}}
    Ça a fonctionné !

2.  Essayez maintenant de supprimer un répertoire qui n'est pas vide :
    `rmdir mon_projet/`{{execute}}
    La commande échoue avec un message d'erreur. `rmdir` vous a protégé !

---

### `rm` : Le bulldozer

Pour supprimer des fichiers ou des répertoires non vides, on utilise `rm`.

1.  Supprimons un fichier :
    `touch fichier_temporaire.txt`{{execute}}
    `rm fichier_temporaire.txt`{{execute}}

2.  Pour supprimer un répertoire et tout son contenu, il faut l'option `-r` (récursive). **C'est une option dangereuse !**
    Supprimons le répertoire `mon_projet/docs/src` que nous avions déplacé.
    `rm -r mon_projet/src/tests`{{execute}}

### La sécurité AVANT TOUT : `-i` et `-I`

Pour éviter les catastrophes, utilisez TOUJOURS `-i` ou `-I` avec `rm`.

-   `-i` : Demande confirmation pour CHAQUE fichier/répertoire.
-   `-I` : Demande confirmation UNE SEULE FOIS si plus de 3 fichiers sont concernés. **C'est souvent le meilleur compromis.**

Essayons de supprimer tous les fichiers du répertoire `mon_projet_backup` avec l'option de sécurité `-I`.
`rm -I mon_projet_backup/*`{{execute}}

Comme il y a plusieurs fichiers, `rm` vous demande une confirmation unique avant de tout supprimer. Répondez `y` et **Entrée**.

---

### Le danger ultime : `rm -rf`

**NE JAMAIS exécuter `rm -rf` sans être ABSOLUMENT CERTAIN de ce que vous faites.** La combinaison `-r` (récursif) et `-f` (force, sans confirmation) est une arme de destruction massive. La commande `rm -rf /` détruirait TOUT votre système de fichiers.
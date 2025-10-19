# Étape 3 : Contrôler les erreurs (stderr)

Pour rediriger les erreurs, on précise le numéro du flux : `2>`.

Reprenons notre commande qui génère une erreur. Cette fois, nous allons laisser le résultat normal s'afficher à l'écran, mais nous allons capturer l'erreur dans un fichier.

`ls /etc /un_dossier_qui_n_existe_pas 2> erreurs.log`{{execute}}

Regardez : seule la liste de `/etc` (stdout) s'est affichée. L'erreur a été capturée. Vérifions le fichier d'erreurs.

`cat erreurs.log`{{execute}}

---

### Fusionner les flux avec `2>&1`

Parfois, on veut tout (résultats ET erreurs) dans le même fichier. Pour cela, on redirige `stderr` (2) vers la destination de `stdout` (1) avec `2>&1`. **L'ordre est crucial !**

`ls /etc /un_dossier_qui_n_existe_pas > tout_en_un.log 2>&1`{{execute}}

Cette fois, l'écran est vide. Tout a été capturé.

`cat tout_en_un.log`{{execute}}

Vous voyez que le fichier contient à la fois la liste des fichiers et le message d'erreur, dans l'ordre où ils sont apparus.
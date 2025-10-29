Pour rediriger les erreurs (`stderr`), on précise le numéro du flux : `2>`.

Reprenons notre commande qui génère une erreur. Cette fois, laissons le résultat normal s'afficher à l'écran, mais capturons l'erreur dans un fichier.

`ls /etc /un_dossier_qui_n_existe_pas 2> erreurs.log`{{execute}}

Regardez : seule la liste de `/etc` (`stdout`) s'est affichée. L'erreur a été capturée. Vérifions le fichier d'erreurs.

`cat erreurs.log`{{execute}}

### Ajouter des erreurs avec `2>>`

Tout comme `>>` pour `stdout`, on peut utiliser `2>>` pour ajouter des erreurs à un fichier de log sans l'écraser.

`ls /un_autre_dossier_inexistant 2>> erreurs.log`{{execute}}
`cat erreurs.log`{{execute}}

Le fichier contient maintenant les deux messages d'erreur.

---

### Fusionner les flux avec `2>&1`

Parfois, on veut tout (résultats ET erreurs) dans le même fichier. Pour cela, on redirige `stderr` (2) vers la destination de `stdout` (1) avec `2>&1`. **L'ordre est crucial !**

`ls /etc /un_dossier_qui_n_existe_pas > tout_en_un.log 2>&1`{{execute}}

Cette fois, l'écran est vide. Tout a été capturé.

`cat tout_en_un.log`{{execute}}

Le fichier contient à la fois la liste des fichiers et le message d'erreur.

### Le raccourci moderne : `&>`

Il existe un raccourci plus court pour `> fichier 2>&1` : `&> fichier`. C'est plus simple à écrire et fait exactement la même chose.

`ls /etc /un_dossier_qui_n_existe_pas &> tout_en_un_moderne.log`{{execute}}
`cat tout_en_un_moderne.log`{{execute}}
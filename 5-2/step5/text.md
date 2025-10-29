Deux outils complètent votre panoplie de plombier.

### `tee` : Voir ET sauvegarder

Que faire si vous voulez **à la fois voir** la sortie à l'écran **et la sauvegarder** dans un fichier ? C'est le rôle de `tee`. Il duplique le flux, comme un raccord en "T" de plomberie.

Listons les fichiers de `/etc` : nous voulons voir la liste ET la sauvegarder dans `liste_tee.txt`.

`ls /etc | tee liste_tee.txt`{{execute}}

La liste s'affiche, et si vous vérifiez le fichier... elle y est aussi !

`cat liste_tee.txt`{{execute}}

Pour **ajouter** à un fichier avec `tee` au lieu de l'écraser, utilisez l'option `-a` (append). Ajoutons la date actuelle à notre fichier.

`date | tee -a liste_tee.txt`{{execute}}
`cat liste_tee.txt`{{execute}}

---

### `/dev/null` : Le trou noir

Parfois, vous ne voulez tout simplement pas voir une sortie. `/dev/null` est un fichier spécial qui agit comme un trou noir : tout ce que vous y redirigez disparaît à jamais.

C'est très utile pour ignorer les messages d'erreur qui "polluent" l'affichage.

`find /etc -name "*.conf" 2> /dev/null`{{execute}}

La commande `find` cherche les fichiers, mais toutes les erreurs "Permission denied" (qui vont sur `stderr`) sont envoyées dans `/dev/null` et disparaissent. Vous n'obtenez que la liste propre des fichiers trouvés !
Parfois, `find` peut être lent, surtout si vous cherchez sur tout le système (`/`). Pour les recherches rapides par nom, il y a une solution magique : `locate`.

`locate` utilise une base de données pré-indexée de tous les fichiers. C'est **extrêmement rapide**.

Essayons de trouver le fichier de configuration du service SSH, `sshd_config`.

`locate sshd_config`{{execute}}

Le résultat est instantané !

---

### Le piège de `locate`

`locate` a une faiblesse : sa base de données n'est pas mise à jour en temps réel.

Créons un nouveau fichier.

`touch ~/mon_fichier_tout_neuf.txt`{{execute}}

Maintenant, essayons de le trouver avec `locate`.

`locate mon_fichier_tout_neuf.txt`{{execute}}

Rien ! Le fichier est trop récent, il n'est pas encore dans la base de données. Pour forcer la mise à jour, un administrateur peut utiliser `sudo updatedb`. Faisons-le.

`sudo updatedb`{{execute}}

Maintenant que la base de données est à jour, réessayons.

`locate mon_fichier_tout_neuf.txt`{{execute}}

Succès ! Vous comprenez maintenant la différence : `find` est lent mais toujours à jour ; `locate` est rapide mais peut avoir un temps de retard.
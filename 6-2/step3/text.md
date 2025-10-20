Le plus souvent, vous ne voulez pas céder la propriété, mais juste partager un fichier avec une équipe. Pour cela, on change le groupe du fichier.

### Créer une équipe (un groupe)

Créons un nouveau groupe pour notre équipe de développement web.

`sudo groupadd webteam`{{execute}}

Ajoutons l'utilisateur `learner` à cette nouvelle équipe avec `usermod -aG` (`-a` pour **a**jouter, `-G` pour les **g**roupes).

`sudo usermod -aG webteam learner`{{execute}}

*Note : sur un vrai système, il faudrait se déconnecter/reconnecter pour que le nouveau groupe soit actif, mais pour ce lab ce n'est pas nécessaire.*

---
### Assigner un fichier au groupe

La commande `chgrp` (**ch**ange **gr**ou**p**) permet de changer uniquement le groupe d'un fichier.

Assignons notre fichier `site_config.conf` au groupe `webteam`.

`chgrp webteam site_config.conf`{{execute}}

Vérifions avec `ls -l`.

`ls -l site_config.conf`{{execute}}

Le propriétaire est toujours `learner`, mais le fichier est maintenant partagé avec le groupe `webteam`.
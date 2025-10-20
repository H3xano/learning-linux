Le plus souvent, vous ne voulez pas céder la propriété, mais juste partager un fichier avec une équipe. Pour cela, on change le groupe du fichier.

### Créer une équipe (un groupe)

Créons un nouveau groupe pour notre équipe de développement web.

`sudo groupadd webteam`{{execute}}

Ajoutons l'utilisateur `learner` à cette nouvelle équipe avec `usermod -aG`.

`sudo usermod -aG webteam learner`{{execute}}

---
### Assigner un fichier au groupe

La commande `chgrp` (**ch**ange **gr**ou**p**) permet de changer uniquement le groupe d'un fichier.

Assignons notre fichier `site_config.conf` au groupe `webteam`.

`sudo chgrp webteam site_config.conf`{{execute}}

**Note :** Nous utilisons `sudo` ici. Pourquoi ? Même si vous êtes propriétaire du fichier, la règle de `chgrp` est que vous devez aussi appartenir au groupe cible. Le changement de groupe avec `usermod` n'est actif que dans une **nouvelle session**. `sudo` permet de forcer le changement immédiatement.

Vérifions avec `ls -l`.

`ls -l site_config.conf`{{execute}}

Le propriétaire est toujours `learner`, mais le fichier est maintenant partagé avec le groupe `webteam`.
Parfois, vous voulez seulement changer le groupe d'un fichier sans toucher au propriétaire. C'est le rôle de `chgrp` (**ch**ange **gr**ou**p**).

Regardons le fichier `site_config.conf`.

`ls -l site_config.conf`{{execute}}

Il appartient à `learner:learner`. Changeons son groupe pour `webteam`, l'équipe que nous avons créée à l'étape précédente.

`sudo chgrp webteam site_config.conf`{{execute}}

Vérifions le résultat : le propriétaire est resté `learner`, mais le groupe est maintenant `webteam`.

`ls -l site_config.conf`{{execute}}

---
### La Règle d'Or : L'Appartenance au Groupe

`chgrp` a une règle importante. En tant qu'utilisateur normal (sans `sudo`), vous ne pouvez changer le groupe d'un fichier que si vous appartenez vous-même au nouveau groupe.

Vérifions vos groupes.

`groups`{{execute}}

Vous faites partie de `learner`, `sudo` et `webteam`, mais **pas** de `equipe`. Essayons de changer le groupe du fichier pour `equipe`.

`chgrp equipe site_config.conf`{{execute}}

`Operation not permitted` ! L'opération échoue car vous ne faites pas partie du groupe `equipe`. C'est une mesure de sécurité qui empêche de donner l'accès à des équipes dont on ne fait pas partie.
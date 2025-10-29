Avant de faire quoi que ce soit, il faut savoir qui vous êtes aux yeux du système.

### `whoami` : La question la plus simple

Cette commande vous retourne simplement votre nom d'utilisateur.

`whoami`

### `id` : Votre carte d'identité complète

La commande `id` est bien plus détaillée. Elle vous montre votre numéro d'utilisateur unique (**UID**), votre groupe principal (**GID**), et tous les groupes auxquels vous appartenez.

`id`

### `groups` : La liste de vos équipes

Pour voir uniquement la liste des groupes auxquels vous appartenez, utilisez la commande `groups`.

`groups`

---
### Aller plus loin : Explorer avec `id`

La commande `id` peut être encore plus précise.

- Pour ne voir **que** votre nom d'utilisateur, utilisez l'option `-un` :
`id -un`

- Vous pouvez aussi l'utiliser pour investiguer d'autres utilisateurs. Voyons par exemple l'identité du super-utilisateur, `root` :
`id root`

Vous savez maintenant comment vérifier précisément votre identité sur n'importe quel système Linux !
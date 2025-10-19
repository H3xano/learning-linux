# Étape 2 : Les raccourcis magiques de `cd`

Taper des chemins complets est long. Heureusement, `cd` possède des raccourcis ultra-efficaces !

### `cd ..` : Remonter d'un niveau

Le `..` représente le répertoire parent (celui juste au-dessus). Depuis `/etc`, remontons à la racine `/`.

`cd ..`{{execute}}
`pwd`{{execute}}

### `cd ~` ou `cd` : Retour à la maison

Le tilde `~` est le raccourci universel pour votre répertoire "home". La commande `cd` sans argument fait la même chose. C'est le moyen le plus rapide de "rentrer chez soi".

`cd ~`{{execute}}
`pwd`{{execute}}

### `cd -` : Le va-et-vient

C'est le raccourci le plus cool ! `cd -` vous ramène au **dernier répertoire où vous étiez**. C'est parfait pour basculer entre deux dossiers.

Allons d'abord dans `/var/log`.
`cd /var/log`{{execute}}

Maintenant, utilisez `cd -` pour revenir à votre "home" (là où vous étiez juste avant).
`cd -`{{execute}}

Utilisez-le à nouveau pour retourner dans `/var/log` !
`cd -`{{execute}}
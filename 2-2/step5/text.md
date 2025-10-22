# Étape 5 : La Substitution de Commande `$()`

La substitution de commande permet d'utiliser le **résultat** d'une commande à l'intérieur d'une autre. C'est la clé pour créer des commandes dynamiques.

La syntaxe est `$(commande)`.

### Créer un fichier avec la date

Créons une archive de nos fichiers `.txt` et incluons la date et l'heure actuelles dans le nom du fichier.

`tar -czf backup-$(date +%Y-%m-%d_%H%M%S).tar.gz *.txt`{{execute}}

Le shell a d'abord exécuté `date`, puis a utilisé son résultat pour construire le nom du fichier. Vérifions le fichier créé.

`ls -l backup-*.tar.gz`{{execute}}

---
### Utiliser des résultats dans des `echo`

Annonçons combien de fichiers `.txt` nous avons.

`echo "Il y a $(ls *.txt | wc -l) fichiers .txt dans ce dossier."`{{execute}}

### Manipuler des variables (`${}`)

La substitution de paramètres `${...}` est très puissante pour manipuler des chaînes. Par exemple, pour changer une extension.

`FICHIER="image.jpeg"`{{execute}}
`echo "Nouveau nom : ${FICHIER%.jpeg}.jpg"`{{execute}}

Le `${FICHIER%.jpeg}` a retiré l'ancienne extension, nous permettant d'en ajouter une nouvelle.
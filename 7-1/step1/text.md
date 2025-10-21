# Étape 1 : Créer son Premier Script Bash

Un script Bash est un fichier texte contenant des commandes qui s'exécutent les unes après les autres.

### Le Shebang et la Création

La toute première ligne d'un script doit être le **shebang** : `#!/bin/bash`. Il indique au système d'utiliser Bash pour interpréter le script.

Créons notre premier script avec `nano`.

`nano premier_script.sh`{{execute}}

Dans l'éditeur `nano`, écrivez les lignes suivantes :
```bash
#!/bin/bash
# Mon tout premier script
echo "Bonjour le monde de l'automatisation !"
echo "La date est :"
date
```
Sauvegardez avec `Ctrl+O` (puis Entrée) et quittez avec `Ctrl+X`.

---
### Rendre le script exécutable

Un script n'est qu'un fichier texte tant qu'on ne lui a pas donné la permission d'exécution.

`ls -l premier_script.sh`{{execute}}

Il n'y a pas de `x` dans les permissions. Ajoutons-le avec `chmod`.

`chmod +x premier_script.sh`{{execute}}
`ls -l premier_script.sh`{{execute}}

Le `x` est apparu ! Votre fichier est maintenant un programme.

---
### Exécuter le script

Pour exécuter un script dans le répertoire courant, il faut utiliser `./` devant son nom.

`./premier_script.sh`{{execute}}

Félicitations, vous avez créé et exécuté votre premier robot !
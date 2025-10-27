Maintenant, devenons des détectives. Comment inspecter en profondeur un environnement ?

### `set` vs `env`

La commande `env` ne montre que les variables *exportées* (transmises aux sous-processus). La commande `set` montre **absolument tout** : variables d'environnement, variables locales du shell, et même les fonctions définies.

Comparons le nombre de variables affichées par chacune.

`echo "Variables d'environnement (env) : $(env | wc -l)"`{{execute}}
`echo "Toutes les variables du shell (set) : $(set | wc -l)"`{{execute}}

La différence est énorme ! `set` est l'outil de radiographie complet.

---
### Diagnostiquer le `$PATH`

Imaginez qu'une commande ne soit pas trouvée. Votre premier réflexe doit être de diagnostiquer le `$PATH`. Voici un mini-script de diagnostic.

`echo $PATH | tr ':' '\n' | while read dossier; do if [ -d "$dossier" ]; then echo "✅ OK: $dossier"; else echo "❌ ERREUR: $dossier n'existe pas !"; fi; done`{{execute}}

Ce script vérifie que chaque dossier de votre `$PATH` existe bien. Si l'un d'eux est manquant, vous avez trouvé une erreur de configuration !

---
### Le Code de Retour : Succès ou Échec ?

Un bon détective doit savoir si sa dernière opération a réussi. Linux utilise un **code de retour** : `0` pour un succès, et une autre valeur (de 1 à 255) pour une erreur. Vous pouvez voir ce code avec la variable spéciale `$?`.

Essayons une commande qui réussit :

`ls /`{{execute}}
`echo "Code de retour : $?"`{{execute}}

Le code est `0`, tout s'est bien passé. Maintenant, une commande qui échoue :

`ls /ce_dossier_n_existe_pas`{{execute}}
`echo "Code de retour : $?"`{{execute}}

Le code est différent de `0`, signalant une erreur. Mémoriser `$?` est crucial pour le scripting et le débogage !
# Étape 4 : Le Diagnostic d'Environnement

Maintenant, devenons des détectives. Comment inspecter en profondeur un environnement ?

### `set` vs `env`

La commande `env` ne montre que les variables *exportées* (transmises aux sous-processus). La commande `set` montre **absolument tout** : variables d'environnement, variables locales du shell, et même les fonctions définies.

Comparons le nombre de variables affichées par chacune.

`echo "Variables d'environnement (env) : $(env | wc -l)"`{{execute}}
`echo "Toutes les variables du shell (set) : $(set | wc -l)"`{{execute}}

La différence est énorme ! `set` est l'outil de radiographie complet.

---
### Devenir un expert du diagnostic

Imaginez qu'une commande ne soit pas trouvée. Votre premier réflexe doit être de diagnostiquer le `$PATH`. Voici un mini-script de diagnostic.

`echo $PATH | tr ':' '\n' | while read dossier; do if [ -d "$dossier" ]; then echo "✅ OK: $dossier"; else echo "❌ ERREUR: $dossier n'existe pas !"; fi; done`{{execute}}

Ce script vérifie que chaque dossier de votre `$PATH` existe bien. Si l'un d'eux est manquant, vous avez trouvé une erreur de configuration ! C'est ce genre de diagnostic méthodique qui fait un bon administrateur.
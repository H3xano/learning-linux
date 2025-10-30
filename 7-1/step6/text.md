### Le moment de vérité : Assembler le Robot !

Vous avez appris à utiliser les variables, les paramètres, les conditions et les boucles. Il est temps de tout combiner pour créer un véritable outil d'automatisation : un script de nettoyage intelligent.

**Votre mission :** Créer un script `cleanup.sh` qui nettoie un répertoire.

`nano cleanup.sh`{{execute}}

Écrivez ce code qui utilise TOUS les concepts que vous avez vus :
```bash
#!/bin/bash
# Script de nettoyage intelligent

# 1. PARAMÈTRES avec valeur par défaut
REPERTOIRE=${1:-"/tmp"}

echo "Lancement du nettoyage dans : $REPERTOIRE"

# 2. CONDITION : Vérifier si le répertoire existe
if [ ! -d "$REPERTOIRE" ]; then
    echo "Erreur : Le répertoire $REPERTOIRE n'existe pas."
    exit 1
fi

# 3. VARIABLE : Un compteur pour les fichiers supprimés
COMPTEUR=0

# 4. BOUCLE : Parcourir les fichiers .log et .tmp
for fichier in "$REPERTOIRE"/*.log "$REPERTOIRE"/*.tmp; do
    
    # Condition imbriquée : on agit seulement si le fichier existe
    if [ -f "$fichier" ]; then
        echo "Suppression de : $fichier"
        rm "$fichier"
        COMPTEUR=$((COMPTEUR + 1))
    fi
done

echo "Nettoyage terminé."
echo "$COMPTEUR fichier(s) ont été supprimé(s)."
```
Sauvegardez, quittez, et rendez le script exécutable.
`chmod +x cleanup.sh`{{execute}}

---
### Tester votre automate

Créons un environnement de test dans `/tmp`.
`touch /tmp/a.log /tmp/b.tmp /tmp/c.txt`{{execute}}
`ls /tmp`{{execute}}

Maintenant, lancez votre script pour nettoyer ce répertoire.
`./cleanup.sh /tmp`{{execute}}

Vérifiez le résultat. Seuls les fichiers `.log` et `.tmp` doivent avoir disparu.
`ls /tmp`{{execute}}

Félicitations ! Vous avez créé un outil complet, flexible et intelligent. Vous êtes prêt à automatiser le monde !
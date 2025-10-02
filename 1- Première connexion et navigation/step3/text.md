
## Etape 3 : Creation du rapport final (env. 3 minutes)

Vous allez maintenant generer un rapport horodate qui regroupe toutes vos informations. La commande suivante utilise des variables, des substitutions et une redirection pour ecrire un fichier professionnel en une seule fois.

```plain
RAPPORT="rapport_session_$(date +%Y%m%d_%H%M%S).txt"
```{{exec}}

```plain
{
echo "======================================"
echo "   RAPPORT DE SESSION LINUX REUSSI   "
echo "======================================"
echo ""
echo "Genere par: $(whoami)"
echo "Date/Heure: $(date)"
echo "Systeme: $(uname -s) $(uname -r)"
echo ""
echo "--- IDENTITE COMPLETE ---"
echo "Utilisateur: $(whoami)"
echo "UID/GID: $(id)"
echo "Groupes: $(groups)"
echo ""
echo "--- CONTEXTE TEMPOREL ---"
echo "Date systeme: $(date)"
echo "Calendrier du mois:"
cal
echo ""
echo "--- ETAT SYSTEME ---"
uptime
echo ""
echo "--- PREUVE DE MAITRISE ---"
echo "Fichier genere en une seule commande complexe !"
echo "Demonstration de: variables, substitution, redirection"
echo ""
echo "🎉 MODULE 1 TERMINE AVEC SUCCES ! 🎉"
} > $RAPPORT
```{{exec}}

Si la commande `cal` est indisponible sur l'image, remplacez-la par `ncal` ou ajoutez une ligne descriptive a la place.

```plain
echo "✅ Rapport cree: $RAPPORT"
```{{exec}}

Cette etape valide votre capacite a assembler plusieurs notions en une commande compacte. Note : les emojis restent visibles dans le fichier meme si votre terminal ne les interprete pas.

Verifiez que le fichier existe :

```plain
ls -l rapport_session_*.txt
```{{exec}}

Vous devriez voir un nom du type `rapport_session_20250101_142530.txt`.

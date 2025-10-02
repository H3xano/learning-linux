
## Etape 2 : Collecte d'informations systeme (env. 4 minutes)

Construisez maintenant un profil complet de votre session en reutilisant les commandes du module 1. Executez le bloc suivant commande par commande et observez les informations remontees.

### Identite utilisateur

```plain
echo "=== RAPPORT DE SESSION LINUX ==="
```{{exec}}

```plain
echo "Genere le: $(date)"
```{{exec}}

```plain
echo ""
```{{exec}}

```plain
echo "IDENTITE UTILISATEUR:"
```{{exec}}

```plain
whoami
```{{exec}}

```plain
id
```{{exec}}

```plain
groups
```{{exec}}

Astuce : utilisez les fleches `↑` et `↓` pour rejouer les commandes sans tout retaper.

### Contexte temporel et etat de la machine

```plain
echo ""
```{{exec}}

```plain
echo "CONTEXTE TEMPOREL:"
```{{exec}}

```plain
date
```{{exec}}

```plain
cal
```{{exec}}

Si `cal` n'est pas disponible, utilisez `ncal` pour afficher le calendrier du mois.

```plain
echo ""
```{{exec}}

```plain
echo "ETAT SYSTEME:"
```{{exec}}

```plain
uptime
```{{exec}}

### Historique recent

```plain
echo ""
```{{exec}}

```plain
echo "HISTORIQUE RECENT (5 dernieres commandes):"
```{{exec}}

```plain
history | tail -5
```{{exec}}

A la fin de cette etape, vous disposez a l'ecran de toutes les informations qui alimenteront votre rapport final.

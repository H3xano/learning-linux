Maintenant, assemblons plusieurs de ces commandes dans un script pour créer notre propre tableau de bord personnalisé.

`nano mon_dashboard.sh`{{execute}}

Copiez et collez le code suivant dans l'éditeur `nano`. Ce script est une synthèse des outils que nous avons vus.

```bash
#!/bin/bash

echo "=========================================="
echo "    DASHBOARD SYSTÈME - $(hostname)"
echo "    $(date)"
echo "=========================================="
echo ""

echo "--- ⚙️ CPU & Charge ---"
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
LOAD=$(uptime | awk -F'load average:' '{print $2}')
echo "Utilisation CPU : ${CPU_USAGE}%"
echo "Load Average    : $LOAD"
echo "Top 3 processus : "
ps aux --sort=-%cpu | head -n 4 | tail -n 3
echo ""

echo "--- 🧠 Mémoire ---"
free -h | grep "Mem"
echo ""

echo "--- 💾 Espace Disque (partitions principales) ---"
df -h | grep -E "^/dev/|Filesystem"
echo ""

echo "--- 🌐 Connectivité Réseau ---"
ping -c 1 -W 1 8.8.8.8 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Internet : OK"
else
    echo "❌ Internet : HORS LIGNE"
fi
echo ""

echo "=========================================="
```
Sauvegardez avec `Ctrl+O` (puis Entrée) et quittez avec `Ctrl+X`.

---
### Exécuter le dashboard

Rendez le script exécutable et lancez-le.

`chmod +x mon_dashboard.sh`{{execute}}
`./mon_dashboard.sh`{{execute}}

En une seule commande, vous avez un rapport complet sur la santé de votre système ! C'est le début de l'automatisation de la surveillance.

**Défi Bonus :** Comment pourriez-vous exécuter ce script automatiquement toutes les heures ? (Indice : la réponse se cache dans la commande `crontab -e`).
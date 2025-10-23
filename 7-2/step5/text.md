Maintenant, assemblons toutes ces commandes dans un script pour créer notre propre tableau de bord.

`nano mon_dashboard.sh`{{execute}}

Copiez et collez le code suivant dans l'éditeur `nano`. C'est un script simple qui collecte les informations les plus importantes.

```bash
#!/bin/bash

echo "=========================================="
echo "    DASHBOARD SYSTÈME - $(hostname)"
echo "    $(date)"
echo "=========================================="
echo ""

echo "--- ⚙️ CPU & Charge ---"
LOAD=$(uptime | awk -F'load average:' '{print $2}')
echo "Load Average : $LOAD"
echo ""

echo "--- 🧠 Mémoire ---"
free -h | grep "Mem"
echo ""

echo "--- 💾 Espace Disque (partitions principales) ---"
df -h | grep -E "^/dev/|Filesystem"
echo ""

echo "--- 🔧 3 Services Critiques ---"
for service in ssh cron rsyslog; do
    if systemctl is-active --quiet $service 2>/dev/null; then
        echo "✅ $service : actif"
    else
        echo "❌ $service : arrêté"
    fi
done
echo ""

echo "--- 📝 5 Dernières Erreurs Système ---"
sudo journalctl -p err -n 5 --no-pager
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
# 🔍 Étape 5 — Sécurité & audit : voir, compter, alerter

Repérez les logs sudo (Debian/Ubuntu : `auth.log`) et extrayez l’essentiel.

Affichage live (arrêtez avec Ctrl+C) :
```bash
sudo tail -f /var/log/auth.log | grep sudo
````

Comptages rapides :

```bash
sudo grep "COMMAND=" /var/log/auth.log | wc -l
sudo grep "NOT in sudoers" /var/log/auth.log | tail -n 5
```

Générer un **mini-rapport** :

```bash
{ whoami; sudo -l; date; } > rapport_2_3.txt
cat rapport_2_3.txt
```

💡 Audit régulier = réflexe de pro (détection d’abus & hygiène opérationnelle).
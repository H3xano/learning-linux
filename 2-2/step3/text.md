# 💻 Étape 3 — Vérifier l’empreinte d’un serveur

1. Observe l’activité générale :
```bash
uptime
```

👉 Temps depuis le dernier boot + charge système. Les serveurs restent souvent allumés **très longtemps**.

2. Qui est connecté ?

```bash
who -a
```

👉 Utile pour savoir si des admins sont en session (locale/SSH).

3. Vois les services actifs :

```bash
systemctl list-units --type=service --state=running | head -n 10
```

👉 Cherche `ssh`, `cron`, `networkd`… typiques d’un serveur sans GUI.

4. Ports réseau en écoute :

```bash
ss -tuln | head -n 10
```

👉 Affiche les ports ouverts (ex: `:22` pour SSH). Les serveurs exposent des **services réseau**.

💡 Peu/aucune trace de GUI + services réseau actifs = profil **Serveur**.
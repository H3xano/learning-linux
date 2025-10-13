# 💻 Étape 3 — Vérifier l’empreinte d’un serveur

Les serveurs Linux sont conçus pour **héberger des services** plutôt que pour afficher des fenêtres.  
Voyons comment reconnaître ce type d’environnement.

```bash
uptime
who
systemctl list-units --type=service --state=running | head -n 10
ss -tuln | head -n 10
````

👉 `uptime` indique depuis combien de temps la machine est active et sa charge.
👉 `who` liste les utilisateurs connectés.
👉 `systemctl` montre les **services actifs** (Apache, SSH, cron...).
👉 `ss -tuln` révèle les **ports réseau ouverts**.

🧠 Si tu vois des services comme `sshd`, `systemd-networkd`, `cron`,
et aucun affichage graphique → tu es face à un **serveur Linux** typique. 💪
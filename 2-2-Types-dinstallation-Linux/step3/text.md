# 💻 Étape 3 — Vérifier l’empreinte d’un serveur

Les serveurs se concentrent sur les services. Regardons l’état et quelques services courants.

```bash
uptime
who
systemctl list-units --type=service --state=running | head -n 10
ss -tuln | head -n 10
````

👉 `uptime` donne la charge, `who` les utilisateurs. `systemctl` montre les services actifs (SSH, web, etc.).
Sur un vrai serveur tu verras peu ou pas de GUI, et beaucoup de services réseau.


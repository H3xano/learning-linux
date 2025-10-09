# 🧭 Étape 1 — Observer la machine

Commençons par récupérer des infos système de base pour savoir où nous sommes.

```bash
uname -a
lsb_release -a
hostnamectl
````

👉 `uname -a` affiche le noyau, `lsb_release -a` la distribution, `hostnamectl` donne le type (VM/physical) et le runtime.
Note ce que chaque commande affiche — ça te servira pour comparer Desktop / Serveur / VM.

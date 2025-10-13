# 🧭 Étape 1 — Observer la machine

Avant de plonger dans le monde Linux, faisons connaissance avec **notre système**.  
Ces premières commandes te donnent une vision claire de ton environnement.

```bash
uname -a
lsb_release -a
hostnamectl
```

👉 `uname -a` affiche le noyau et l’architecture.
👉 `lsb_release -a` te dit quelle **distribution** (Ubuntu, Debian...) tu utilises.
👉 `hostnamectl` révèle souvent si tu es dans une **machine virtuelle** et le type d’hôte.

💬 Note les différences entre ces sorties : elles te permettront plus tard de reconnaître
un **poste Desktop**, un **serveur**, ou une **VM** sans avoir besoin d’écran graphique. 🧠
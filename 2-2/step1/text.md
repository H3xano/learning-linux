# 🧭 Étape 1 — Observer la machine

1) Affiche le noyau et l’architecture :
```bash
uname -a
```

👉 Tu vois la version du noyau Linux, l’architecture (x86_64/arm64) et des infos système utiles.

2. Affiche la distribution :

```bash
lsb_release -a
```

👉 Donne le nom (Ubuntu/Debian…), la version et le codename. Parfait pour savoir “où” tu es.

3. Affiche le contexte hôte :

```bash
hostnamectl
```

👉 Regarde les lignes **Operating System** et **Virtualization** : elles révèlent souvent si tu es dans une **VM**.

💡 Note tes observations : noyau, distribution, VM ou non. On s’en sert pour distinguer Desktop/Serveur/VM.
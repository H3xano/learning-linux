# 🖥️ Étape 2 — Repérer une interface graphique (GUI)

Même sans écran, tu peux savoir si une interface graphique (GUI) est installée ou prévue au démarrage.

```bash
systemctl get-default
ps aux | grep -E 'Xorg|wayland|gdm|sddm' --color=auto
cat /etc/X11/default-display-manager 2>/dev/null || echo "Aucun gestionnaire graphique détecté"
````

👉 Si tu vois `graphical.target`, cela veut dire que le système démarre **en mode graphique**.
👉 Si des noms comme `Xorg`, `gdm` ou `wayland` apparaissent, une GUI existe (même si elle ne s’affiche pas ici).

🧠 **Interprétation :**

* `graphical.target` → système Desktop
* `multi-user.target` → système Serveur (pas de GUI)

Pour **voir réellement** un environnement graphique Ubuntu, ouvre ce lien :

<div style="text-align:center; margin: 30px 0;">
  <a href="https://www.onworks.net/runos/create-os.html?os=ubuntu-22.04.3-desktop-amd64&home=init"
     target="_blank"
     style="background-color:#2a7ae2; color:white; padding:12px 28px;
            border-radius:8px; text-decoration:none; font-weight:bold;">
    🚀 Lancer Ubuntu Desktop
  </a>
  <p style="font-size:14px; color:#666; margin-top:10px;">
    (ouvre Ubuntu Desktop en ligne dans une nouvelle fenêtre)
  </p>
</div>

💬 Compare ce que tu vois sur OnWorks avec ce que tu observes ici dans le terminal.
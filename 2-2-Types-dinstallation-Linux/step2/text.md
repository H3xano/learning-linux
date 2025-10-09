# 🖥️ Étape 2 — Repérer une interface graphique (GUI)

Même sans écran, le terminal peut indiquer s’il y a une GUI installée ou active.

```bash
systemctl get-default
ps aux | grep -E 'Xorg|wayland|gdm|sddm' --color=auto
cat /etc/X11/default-display-manager 2>/dev/null || echo "no DM file"
````

👉 `systemctl get-default` retourne `graphical.target` si une GUI est prévue au démarrage.
Si `Xorg`/`gdm`/`wayland` apparaissent dans `ps`, une session graphique tourne (ou est installée).


### 🧩 Exploration pratique

<div style="text-align:center; margin: 30px 0;">
  <a href="https://www.onworks.net/runos/create-os.html?os=ubuntu-22.04.3-desktop-amd64&home=init" 
     target="_blank" 
     style="background-color:#2a7ae2; color:white; padding:14px 32px; 
            border-radius:8px; text-decoration:none; font-size:18px; font-weight:bold;">
    🚀 Lancer Ubuntu Desktop
  </a>
  <p style="font-size:14px; color:#666; margin-top:10px;">
    (ouvre une nouvelle fenêtre OnWorks avec <strong>Ubuntu 22.04 Desktop</strong>)
  </p>
</div>


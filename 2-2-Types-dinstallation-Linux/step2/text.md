# 🖥️ Étape 2 — Repérer une interface graphique (GUI)

Même sans écran, le terminal peut indiquer s’il y a une GUI installée ou active.

```bash
systemctl get-default
ps aux | grep -E 'Xorg|wayland|gdm|sddm' --color=auto
cat /etc/X11/default-display-manager 2>/dev/null || echo "no DM file"
````

👉 `systemctl get-default` retourne `graphical.target` si une GUI est prévue au démarrage.
Si `Xorg`/`gdm`/`wayland` apparaissent dans `ps`, une session graphique tourne (ou est installée).


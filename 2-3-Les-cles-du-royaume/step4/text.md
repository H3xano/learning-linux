# 📜 Étape 4 — sudoers : lire et valider sans casser

Ne **modifiez jamais** `/etc/sudoers` sans **visudo**. On va **lire** et **valider** en sécurité.

Lister et vérifier la syntaxe :
```bash
sudo head -n 20 /etc/sudoers
sudo visudo -c
````

Tester une règle **dans un fichier temporaire** :

```bash
echo 'alice ALL=(ALL) /usr/bin/systemctl' | sudo tee /tmp/sudoers.demo >/dev/null
sudo visudo -c -f /tmp/sudoers.demo
sudo rm /tmp/sudoers.demo
```

💡 Méthode pro : `visudo -f` pour tester, **puis** utiliser `/etc/sudoers.d/` en prod.

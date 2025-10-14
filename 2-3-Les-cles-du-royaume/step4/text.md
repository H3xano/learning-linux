# 📜 Étape 4 — sudoers : lire et valider sans casser

Le fichier `/etc/sudoers` règle l’accès aux privilèges. Une erreur de syntaxe peut tout bloquer, d’où l’importance d’utiliser `visudo`.

Commence par lire les premières lignes du fichier principal :
```bash
sudo head -n 20 /etc/sudoers
```
L’objectif est uniquement d’observer la structure et les commentaires sans modifier quoi que ce soit.

Ensuite, demande à `visudo` de vérifier la syntaxe actuelle :
```bash
sudo visudo -c
```
La commande doit répondre `parsed OK` si la configuration est valide. En cas d’erreur, tu saurais immédiatement qu’il faut intervenir.

Pour expérimenter en toute sécurité, crée un fichier de test :
```bash
echo 'alice ALL=(ALL) /usr/bin/systemctl' | sudo tee /tmp/sudoers.demo >/dev/null
```
Cette ligne ajoute une règle fictive dans `/tmp/sudoers.demo` sans toucher au fichier principal.

Contrôle la syntaxe de cette règle avec `visudo` :
```bash
sudo visudo -c -f /tmp/sudoers.demo
```
Tu dois à nouveau voir `parsed OK`. Cela confirme que la règle serait acceptée si tu l’activais.

Nettoie enfin le fichier temporaire :
```bash
sudo rm /tmp/sudoers.demo
```
On évite ainsi de laisser traîner du contenu sensible dans `/tmp`.

💡 Au quotidien, rédige tes ajouts dans `/etc/sudoers.d/nom_fichier` avec `visudo -f`. Tu bénéficies de la validation sans risquer de corrompre la configuration principale.

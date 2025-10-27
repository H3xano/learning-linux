Configurons l'historique et des options de sécurité pour un shell de niveau professionnel.

Ajoutons ce bloc de configuration à notre `.bashrc`.

```bash
cat <<'EOF' >> ~/.bashrc

# --- Configuration Historique & Options ---
# Historique plus grand avec horodatage
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTTIMEFORMAT="%F %T "

# Ne pas sauvegarder les doublons consécutifs
export HISTCONTROL=ignoredups

# Activer la correction des fautes de frappe pour la commande cd
shopt -s cdspell

# Protéger les fichiers existants contre l'écrasement accidentel
set -o noclobber
EOF
```{{execute}}

Rechargez la configuration.

`source ~/.bashrc`{{execute}}

---
### Tester les nouvelles fonctionnalités

**1. Correction automatique (`cdspell`) :**
`cd /hoem`{{execute}}
Le shell a corrigé pour `/home` !

**2. Protection (`noclobber`) :**
`echo "contenu initial" > mon_fichier.txt`{{execute}}
`echo "contenu écrasé" > mon_fichier.txt`{{execute}}
Le shell vous empêche d'écraser le fichier. Pour forcer, il faudrait utiliser `>|`.

**3. L'historique surpuissant (`Ctrl+R`) :**
Votre historique est maintenant immense. Pour retrouver une commande, n'utilisez plus les flèches !
**Appuyez sur `Ctrl+R`**, puis commencez à taper un morceau de la commande que vous cherchez (par ex: `hoem`).
`(reverse-i-search)`hoem': cd /hoem`
La commande apparaît ! Appuyez sur `Entrée` pour l'exécuter ou sur `Ctrl+R` à nouveau pour trouver une occurrence plus ancienne. C'est le raccourci le plus important pour être productif.
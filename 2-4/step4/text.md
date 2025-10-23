Configurons le shell pour qu'il soit plus intelligent : un historique plus grand, sans doublons, et une correction automatique des fautes de frappe !

Ajoutons un bloc de configuration complet à notre `.bashrc`.

```bash
echo '
# --- Configuration Historique & Options ---
# Historique plus grand
export HISTSIZE=10000
export HISTFILESIZE=20000

# Ne pas sauvegarder les doublons et les commandes qui commencent par un espace
export HISTCONTROL=ignoreboth

# Synchroniser l_historique entre plusieurs terminaux
export PROMPT_COMMAND="history -a; history -n"

# Activer la correction des fautes de frappe pour la commande cd
shopt -s cdspell
' >> ~/.bashrc
```{{execute}}

Rechargez la configuration.

`source ~/.bashrc`{{execute}}

---
### Tester les nouvelles fonctionnalités

**1. Correction automatique (`cdspell`) :**
Essayez de taper `cd /hoem` (avec une faute de frappe) et appuyez sur Entrée.

`cd /hoem`{{execute}}

Le shell a corrigé automatiquement en `/home` et vous y a emmené !

**2. Historique sans doublons (`ignoreboth`) :**
Tapez deux fois la même commande.

`ls`{{execute}}
`ls`{{execute}}

Maintenant, affichez l'historique.

`history | tail -n 5`{{execute}}

La commande `ls` n'apparaît qu'une seule fois. Votre historique est maintenant plus propre et plus utile. Vous avez configuré un shell de niveau professionnel !
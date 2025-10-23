Votre prompt (`learner@ubuntu:~$`) est défini par la variable `PS1`. Nous allons le personnaliser pour qu'il soit plus joli et plus informatif.

### Ajouter des couleurs

Les couleurs sont définies par des codes spéciaux. Nous allons créer des variables pour les rendre plus lisibles.

Ajoutez ce bloc de configuration à votre `.bashrc`.

```bash
echo '
# --- Configuration du Prompt ---
# Couleurs
GREEN="\[\e[32m\]"
BLUE="\[\e[34m\]"
YELLOW="\[\e[33m\]"
RESET="\[\e[0m\]"

# Structure du Prompt
PS1="${GREEN}\u@\h${RESET}:${BLUE}\w${RESET}${YELLOW}\$ ${RESET}"
' >> ~/.bashrc
```{{execute}}

**Décryptage :**
-   `\u` : votre nom d'utilisateur
-   `\h` : le nom de la machine
-   `\w` : le chemin complet du répertoire
-   `\$` : `$` pour un utilisateur normal, `#` pour `root`

Rechargez votre configuration pour voir la magie opérer !

`source ~/.bashrc`{{execute}}

Votre prompt est maintenant coloré ! Naviguez dans un autre dossier pour voir le chemin changer de couleur.

`cd /etc`{{execute}}
`cd ~`{{execute}}
Votre prompt (`learner@...`) est défini par la variable `PS1`. Rendons-le non seulement joli, mais aussi "intelligent" : il nous dira si la dernière commande a réussi ou échoué.

Ajoutez ce bloc de configuration complet à votre `.bashrc`. La syntaxe `cat <<'EOF' >> ...` est idéale pour ajouter plusieurs lignes sans problème de guillemets.

```bash
cat <<'EOF' >> ~/.bashrc

# --- Configuration du Prompt Intelligent ---
# Couleurs
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
BLUE="\[\e[34m\]"
YELLOW="\[\e[33m\]"
RESET="\[\e[0m\]"

# Structure du Prompt avec indicateur de succès/échec
PS1="\$(if [ \$? = 0 ]; then echo \"${GREEN}✓\"; else echo \"${RED}✗\"; fi)${RESET} ${GREEN}\u@\h${RESET}:${BLUE}\w${RESET}${YELLOW}\$ ${RESET}"
EOF
```{{execute}}

**Décryptage de la partie intelligente :**
`\$(if [ \$? = 0 ]; then ...)` vérifie le code de sortie (`$?`) de la dernière commande. Si c'est `0` (succès), il affiche un `✓` vert. Sinon, il affiche un `✗` rouge.

Rechargez votre configuration pour voir la magie opérer !

`source ~/.bashrc`{{execute}}

Vous voyez le `✓` ? Maintenant, testons l'échec en tapant une commande qui n'existe pas.

`lss`{{execute}}

Le prompt affiche maintenant un `✗` rouge ! Cet indicateur visuel est extrêmement utile pour repérer les erreurs immédiatement.
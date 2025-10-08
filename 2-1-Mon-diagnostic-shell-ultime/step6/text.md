# 🧩 Étape 6 – Créer un mini script de diagnostic

Vous allez automatiser l’analyse de votre environnement avec un petit script.

```bash
nano diagnostic.sh
````

Collez-y ceci :

```bash
#!/bin/bash
echo "=== DIAGNOSTIC SHELL ==="
echo "Utilisateur : $USER"
echo "Shell : $SHELL"
echo "Répertoire personnel : $HOME"
echo "Type : $0"
[[ $- == *i* ]] && echo "Mode : interactif" || echo "Mode : non-interactif"
[ -n "$SSH_CLIENT" ] && echo "Connexion SSH : $SSH_CLIENT" || echo "Session locale"
echo "PATH :"
echo "$PATH" | tr ':' '\n'
echo "Langue : $LANG"
echo "Variables totales : $(env | wc -l)"
```

Rendez-le exécutable et lancez-le :

```bash
chmod +x diagnostic.sh
./diagnostic.sh
```

👉 Vous obtenez un rapport clair et automatique 🩺
Votre premier **outil de diagnostic shell** !
# 🧩 Étape 3 – Identifier le type de session

Tous les shells ne sont pas égaux. Découvrons votre **type de session**.

```bash
echo $0
````

👉 Si le nom commence par `-bash`, c’est un **login shell**.
Sinon, c’est un **non-login shell** (typiquement un terminal graphique).

```bash
[[ $- == *i* ]] && echo "Shell interactif" || echo "Shell non-interactif"
```

👉 Vous apprenez à distinguer un **shell interactif** d’un **script automatisé**.

Enfin, testez la connexion :

```bash
if [ -n "$SSH_CLIENT" ]; then
    echo "🌐 Session SSH détectée"
else
    echo "🏠 Session locale"
fi
```

Vous savez maintenant si vous êtes **chez vous** ou **connecté à distance** ! 🌍

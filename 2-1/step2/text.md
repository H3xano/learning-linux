
# 🧩 Étape 2 – Explorer vos variables d’environnement

Votre shell est rempli de **variables automatiques** : il sait qui vous êtes, où vous êtes, et comment agir.

```bash
env | head -20
````

👉 Vous voyez les 20 premières variables.
Elles configurent votre langue, vos chemins, et même votre terminal.

```bash
echo "Mon domicile : $HOME"
echo "Mon nom : $USER"
echo "Mon PATH : $PATH"
```

👉 Le `$PATH` est le **GPS du shell** : il indique où Linux cherche les commandes.

Pour explorer tout votre environnement :

```bash
set | less
```

👉 `set` affiche toutes les variables, y compris celles invisibles pour `env`.
Vous observez la **radiographie complète** de votre shell. 🩻
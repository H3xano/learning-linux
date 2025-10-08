# 🧩 Étape 7 – Vérifier la santé du PATH

Le PATH est votre **système circulatoire** Linux : s’il se bouche, tout s’arrête.

Affichez-le joliment :

```bash
echo "$PATH" | tr ':' '\n'
````

👉 Chaque ligne est un répertoire où Linux cherche vos commandes.

Testez leur validité :

```bash
for dir in $(echo $PATH | tr ':' ' '); do
  [ -d "$dir" ] || echo "⚠️  Répertoire manquant : $dir"
done
```

👉 Vous détectez instantanément les **chemins cassés**.
C’est un réflexe professionnel. 🧰
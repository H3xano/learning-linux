# 🧩 Étape 8 – Activer le mode “rayons X” du shell

Le mode trace vous permet de **voir tout ce que fait le shell** en coulisses.

Activez-le :

```bash
set -x
echo "Diagnostic en cours..."
ls /tmp
set +x
````

👉 Toutes les commandes s’affichent avant exécution.
C’est le **scanner interne** du shell — indispensable pour débugger vos scripts. 🕵️‍♂️
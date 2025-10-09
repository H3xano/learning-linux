# 🧩 Étape 5 — Résume et choisis

Récapitule ce que tu as observé et choisis le type adapté à ton objectif.

```bash
echo "Résumé :"
echo "- whoami: $(whoami)"
echo "- type: $(hostnamectl --pretty 2>/dev/null || echo unknown)"
uname -a | cut -c1-80
````

👉 Si tu veux **apprendre** et tester sans risque → choisis une **VM**.
👉 Pour de la **productivité bureautique** → Desktop. Pour de la **production** → Serveur.
Bravo — tu sais maintenant diagnostiquer le type d’installation Linux via la console ! 🎯

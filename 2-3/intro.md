![Formip](../assets/formip_logo_padded.png)

# 🔐 Les Clés du Royaume

Quand on parle de privilèges sous Linux, tout tourne autour d’un symbole : **root**. Ce lab t’accompagne pour comprendre comment approcher cette puissance sans mettre le système en danger. Chaque étape raconte une histoire : d’abord tu identifies qui détient l’UID 0, puis tu apprends à emprunter ce pouvoir avec `sudo`, à comparer avec `su`, à lire les règles d’accès et, enfin, à vérifier que tout est resté propre.

## 🎯 Objectifs
- Découvrir pourquoi l’UID 0 représente l’autorité ultime
- Utiliser `sudo` de manière ponctuelle, encadrée et traçable
- Savoir quand `su` est adapté… et quand il vaut mieux l’éviter
- Inspecter et valider la configuration `sudoers` sans la casser
- Lancer un mini-audit pour repérer l’usage réel des privilèges

🛡️ La règle d’or : on manipule ces outils avec respect, en observant chaque réaction du système. Installe-toi dans le rôle d’un gardien attentif, et on avance ensemble. 🚀

# 🧩 Étape 4 – Décoder votre profil utilisateur

Votre compte utilisateur cache de nombreuses informations. Explorons-les.

```bash
env | grep -E "(USER|LOGNAME|HOME|MAIL|SHELL|HOSTNAME)"
````

👉 Vous découvrez votre **identité numérique complète**.

Pour vérifier vos paramètres régionaux :

```bash
locale
```

👉 Vous voyez les variables `LANG` et `LC_*` : elles définissent la **langue, le format de date et de monnaie**.

Testez une commande en anglais :

```bash
LC_ALL=C date
```

👉 Le système parle anglais temporairement. 🇬🇧
C’est utile pour comprendre les messages d’erreur universels.
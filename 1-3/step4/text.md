# 📝 Étape 4 — Construire mon rapport final

Vous avez maintenant tout ce qu’il faut :  
- Vous connaissez votre **identité** (`whoami`, `id`, `groups`)  
- Vous savez lire le **temps et l’état du système** (`date`, `cal`, `uptime`)  
- Vous savez **créer et lire des fichiers** (`touch`, `echo`, `cat`)

🎯 Objectif final : assembler tout cela dans un **rapport professionnel** !

---

## 🧰 1) Créer le fichier de rapport

Tapez :

```bash
echo "=== Mon Rapport Linux ===" > rapport.txt
```

💡 Cette ligne crée un nouveau fichier `rapport.txt` et y écrit le titre du rapport.  
Le symbole `>` dit à Linux :  
> “Écris ce texte dans le fichier (et remplace tout ce qu’il y avait avant).”

---

## 👤 2) Ajouter votre identité

Maintenant, ajoutez vos informations personnelles (fournies par Linux lui-même) :

```bash
whoami >> rapport.txt
id >> rapport.txt
groups >> rapport.txt
```

💡 Ces trois commandes ajoutent :
- Votre **nom d’utilisateur**
- Vos **numéros d’identité (UID/GID)**
- Vos **groupes d’appartenance**

Le `>>` permet d’**ajouter** le résultat à la suite du fichier, sans écraser ce qui est déjà écrit.

---

## ⏰ 3) Ajouter le contexte temporel

Tapez :

```bash
date >> rapport.txt
uptime >> rapport.txt
```

👉 Vous enregistrez :
- la **date et l’heure exactes** de votre session,
- la **durée de fonctionnement** et la **santé du système**.

💡 Ces deux commandes sont très utilisées dans les rapports professionnels pour **horodater** une intervention.

---

## 📄 4) Lire votre rapport complet

Tapez :

```bash
cat rapport.txt
```

🎉 Félicitations ! Vous voyez maintenant votre **rapport final** affiché à l’écran.

Il devrait ressembler à ceci :

```

=== Mon Rapport Linux ===
learner
uid=1000(learner) gid=1000(learner) groups=1000(learner),27(sudo)
learner sudo
Mon Oct 6 14:42:10 UTC 2025
14:42:10 up 3 days, 2 users, load average: 0.10, 0.05, 0.02

```

Chaque ligne est **produite automatiquement** à partir de vos commandes précédentes — pas besoin de taper tout à la main !

---

## 🧠 5) Comprendre ce que vous avez construit

Votre fichier `rapport.txt` est une **preuve de compétences**.  
Il contient :
- 💾 votre **identité Linux**
- 🕒 l’**horodatage** de votre session
- ⚙️ l’**état de la machine**

En entreprise, ce type de rapport peut servir à :
- documenter une **intervention technique**
- prouver la **date et l’identité** d’un audit
- automatiser des **rapports journaliers**

> 🧩 Vous venez d’écrire votre premier script de reporting, sans le savoir !

---

## 🚀 Challenge bonus (optionnel)

Essayez de rendre votre rapport **encore plus lisible** :

```bash
echo "--- Fin du rapport ---" >> rapport.txt
cat rapport.txt
```

ou ajoutez des lignes vides pour espacer le contenu :

```bash
echo "" >> rapport.txt
```

🎯 C’est ainsi qu’on apprend à **structurer ses scripts** : petit à petit, commande après commande.

---

## 🥳 Bravo !

Vous avez :

* créé des fichiers,
* utilisé la redirection (`>`, `>>`),
* combiné plusieurs commandes ensemble,
* et produit un **rapport professionnel automatisé**.

C’est votre **première carte de visite Linux** !
Vous venez officiellement d’entrer dans le monde de l’administration système. 🧑‍💻🐧

> "Un vrai admin ne dit pas qu’il a fait quelque chose.
> Il montre un rapport horodaté pour le prouver." 😉

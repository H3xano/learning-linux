# 🐧 Ma première carte de visite Linux

## 🎯 Objectif

Découvrir les toutes premières commandes Linux, apprendre à s’identifier, lire l’heure et créer un petit fichier.
À la fin, vous aurez un **rapport personnel** prouvant que vous savez utiliser les bases de Linux.

---

## 🚀 Étape 1 – Qui suis-je dans ce système ?

Tapez :

```bash
whoami
```

👉 Cette commande répond à la question existentielle : **“Qui suis-je ?”** pour Linux.
Vous devriez voir votre **nom d’utilisateur**.

Ensuite, tapez :

```bash
id
```

👉 Là, Linux vous donne votre **carte d’identité complète** :

* votre numéro unique (UID)
* votre groupe principal
* vos autres groupes

Enfin :

```bash
groups
```

👉 Vous découvrez les “clubs” auxquels vous appartenez (sudo, users, etc.).

---

## ⏰ Étape 2 – Où et quand sommes-nous ?

Tapez :

```bash
date
```

👉 Linux vous dit la date et l’heure exactes.

Tapez :

```bash
cal
```

👉 Vous affichez le calendrier du mois en cours (essayez de repérer votre jour).

Tapez :

```bash
uptime
```

👉 Linux vous révèle :

* depuis combien de temps l’ordinateur est allumé
* combien d’utilisateurs sont connectés
* la “santé” du système (charge).

---

## 📂 Étape 3 – Créer mon premier fichier

Tapez :

```bash
touch carte.txt
```

👉 Vous venez de créer un fichier vide appelé **carte.txt**.

Ajoutez du texte dedans :

```bash
echo "Bonjour, je m'appelle $(whoami) et je découvre Linux !" >> carte.txt
```

Vérifiez :

```bash
cat carte.txt
```

👉 Votre message s’affiche à l’écran. Bravo, c’est votre **premier fichier Linux** 🎉.

---

## 📝 Étape 4 – Construire mon rapport final

Créez un fichier rapport qui rassemble vos découvertes :

```bash
echo "=== Mon Rapport Linux ===" > rapport.txt
whoami >> rapport.txt
id >> rapport.txt
groups >> rapport.txt
date >> rapport.txt
uptime >> rapport.txt
```

Vérifiez son contenu :

```bash
cat rapport.txt
```

👉 Vous avez un **rapport complet** avec votre identité, la date et l’état du système.

---

## 🎉 Mission accomplie !

Félicitations 👏 Vous venez de :
- ✅ Découvrir votre identité Linux (`whoami`, `id`, `groups`)
- ✅ Lire la date, l’heure et l’état système (`date`, `cal`, `uptime`)
- ✅ Créer vos premiers fichiers (`touch`, `echo`, `cat`)
- ✅ Générer un rapport final qui prouve vos compétences

C’est votre **première carte de visite Linux**. Vous pouvez être fier, vous êtes officiellement entré dans le monde des pros du terminal. 🚀🐧

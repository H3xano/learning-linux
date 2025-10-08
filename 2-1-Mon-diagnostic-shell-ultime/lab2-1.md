# 🐚 Mon diagnostic Shell ultime

## 🎯 Objectif

Plonger dans le cœur du **shell Linux** pour comprendre et diagnostiquer votre environnement comme un véritable expert.
Vous allez apprendre à identifier votre shell, explorer vos variables, analyser votre session, et vérifier la santé de votre environnement.

À la fin, vous aurez un **rapport complet d’audit** de votre shell — votre *carte de diagnostic Linux* ! 🩺🐧

---

## 🚀 Étape 1 – Identifier son shell et son environnement

Avant de tout diagnostiquer, découvrez **qui vous êtes** et **où vous êtes** dans le monde du shell.

Tapez :

```bash
echo $SHELL
```

👉 Cela révèle le **programme shell** que vous utilisez (souvent `/bin/bash`).

Ensuite :

```bash
ps -p $$
```

👉 Cette commande montre le **processus** de votre shell actuel.
Elle permet de confirmer son **nom exact** (bash, zsh, etc.).

Pour plus de contexte :

```bash
echo "Shell courant : $0"
echo "Identifiant utilisateur : $USER"
echo "Répertoire personnel : $HOME"
```

👉 Ces trois commandes révèlent **votre identité**, votre **shell**, et votre **home directory**.

---

## 🔍 Étape 2 – Explorer vos variables d’environnement

Votre shell est rempli d’informations : ce sont les **variables d’environnement**.

Tapez :

```bash
env | head -20
```

👉 Vous verrez les 20 premières variables : votre langue, votre PATH, votre terminal, etc.

Pour en savoir plus sur les variables critiques :

```bash
echo "Mon domicile : $HOME"
echo "Mon nom : $USER"
echo "Mon shell : $SHELL"
echo "Mon PATH : $PATH"
```

👉 Vous comprenez maintenant que le `$PATH` est votre **GPS de commandes** : il indique où Linux cherche les programmes.

Pour voir toutes les variables disponibles :

```bash
set | less
```

👉 `set` affiche **toutes** les variables du shell — plus que `env` !
C’est la **radiographie complète** de votre environnement.

---

## 🧭 Étape 3 – Identifier le type de session

Linux peut vous connecter de plusieurs manières. Découvrons quel type de session vous utilisez.

Tapez :

```bash
echo $0
```

👉 Si le résultat commence par `-bash`, c’est un **login shell**.
Sinon, c’est un **non-login shell** (typiquement les terminaux graphiques).

Testez aussi :

```bash
[[ $- == *i* ]] && echo "Shell interactif" || echo "Shell non-interactif"
```

👉 Vous saurez si votre shell est **interactif** (attend vos commandes) ou non (exécution automatique de scripts).

Enfin :

```bash
if [ -n "$SSH_CLIENT" ]; then
    echo "🌐 Vous êtes connecté à distance (SSH)"
else
    echo "🏠 Vous êtes en session locale"
fi
```

👉 Cette vérification est cruciale pour distinguer une session **locale** d’une session **SSH distante**.

---

## 🧠 Étape 4 – Décoder votre profil utilisateur

Votre identité dans Linux va bien au-delà de votre nom. Affichons votre profil complet :

```bash
env | grep -E "(USER|LOGNAME|HOME|MAIL|SHELL|HOSTNAME)"
```

👉 Vous découvrez vos **informations personnelles**, votre **boîte mail système**, et le **serveur** sur lequel vous êtes connecté.

Vérifiez aussi vos **locales** (langue, format, région) :

```bash
locale
```

👉 Si vous voyez `fr_FR.UTF-8`, cela indique un environnement en français, avec les bons formats de date et d’accents.

Pour tester un affichage temporairement en anglais :

```bash
LC_ALL=C date
```

👉 Votre système “pense en anglais” le temps d’une commande ! 🇬🇧

---

## 🧩 Étape 5 – Inspecter les fichiers de configuration du shell

Chaque type de session charge des **fichiers de configuration** différents.
Découvrons lesquels existent sur votre machine :

```bash
ls -a ~ | grep bash
```

👉 Vous verrez sans doute : `.bashrc`, `.bash_profile`, `.bash_logout`…

Pour savoir lesquels sont lus :

```bash
echo "=== Login shell ==="
/etc/profile
~/.bash_profile
~/.profile

echo "=== Non-login shell ==="
/etc/bash.bashrc
~/.bashrc
```

👉 Vous comprenez maintenant pourquoi certains alias ne fonctionnent pas :
ils sont dans le **mauvais fichier** ! 😄

---

## 🧪 Étape 6 – Créer un mini script de diagnostic

Vous allez créer un script qui **analyse automatiquement votre environnement**.

Tapez :

```bash
nano diagnostic.sh
```

Copiez-y le contenu suivant :

```bash
#!/bin/bash
echo "=== DIAGNOSTIC SHELL ==="
echo "Utilisateur : $USER"
echo "Shell : $SHELL"
echo "Répertoire personnel : $HOME"
echo "Type de shell : $0"
[[ $- == *i* ]] && echo "Mode : interactif" || echo "Mode : non-interactif"
[ -n "$SSH_CLIENT" ] && echo "Connexion SSH : $SSH_CLIENT" || echo "Session locale"
echo "PATH :"
echo "$PATH" | tr ':' '\n'
echo "Langue : $LANG"
echo "Nombre total de variables : $(env | wc -l)"
```

Enregistrez avec `Ctrl+O`, puis quittez avec `Ctrl+X`.
Rendez-le exécutable :

```bash
chmod +x diagnostic.sh
```

Puis lancez-le :

```bash
./diagnostic.sh
```

👉 Vous obtenez un **rapport automatique** de votre environnement ! 💪

---

## 🩺 Étape 7 – Vérifier la santé du système et du PATH

Le `$PATH` est le **système circulatoire** du shell. Testons sa santé :

```bash
echo "$PATH" | tr ':' '\n'
```

👉 Vous voyez chaque répertoire où Linux cherche ses commandes.

Pour vérifier qu’ils existent tous :

```bash
for dir in $(echo $PATH | tr ':' ' '); do
  [ -d "$dir" ] || echo "⚠️  Répertoire manquant : $dir"
done
```

👉 Cela détecte les chemins cassés ou supprimés.

---

## 🧰 Étape 8 – Mode “rayons X” du shell

Parfois, il faut voir **ce que fait réellement** le shell.
Activez le mode *trace* :

```bash
set -x
echo "Diagnostic en cours..."
ls /tmp
set +x
```

👉 Toutes les commandes s’affichent avant exécution.
C’est le **mode débogage** des pros. 🕵️‍♂️

---

## 🧾 Étape 9 – Créer votre rapport de diagnostic final

Rassemblez toutes les informations dans un rapport lisible :

```bash
echo "=== Rapport Shell ===" > rapport_shell.txt
echo "Utilisateur : $USER" >> rapport_shell.txt
echo "Shell : $SHELL" >> rapport_shell.txt
echo "Session : $0" >> rapport_shell.txt
echo "Langue : $LANG" >> rapport_shell.txt
echo "Variables : $(env | wc -l)" >> rapport_shell.txt
echo "Répertoires du PATH :" >> rapport_shell.txt
echo "$PATH" | tr ':' '\n' >> rapport_shell.txt
echo "Date du diagnostic : $(date)" >> rapport_shell.txt
```

Vérifiez le résultat :

```bash
cat rapport_shell.txt
```

👉 Félicitations, vous venez de produire votre **rapport d’audit shell professionnel** 🎉

---

## 🎉 Mission accomplie !

Félicitations 👏 Vous venez de :

* ✅ Identifier votre shell et votre type de session
* ✅ Explorer vos variables d’environnement
* ✅ Vérifier vos fichiers de configuration
* ✅ Diagnostiquer le PATH et les erreurs courantes
* ✅ Créer un **script d’audit automatique**
* ✅ Générer un rapport complet de votre environnement

Vous êtes maintenant capable de **comprendre, diagnostiquer et optimiser** n’importe quel environnement Linux.
C’est votre **diagnostic Shell ultime** — le symbole de votre montée en puissance dans l’univers Linux. 🚀🐧

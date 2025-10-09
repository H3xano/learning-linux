# 💿 **Lab – Types d’installation Linux**

---

## 🎯 **Objectif du lab**

Dans ce lab, tu vas **comprendre concrètement les trois grandes façons d’installer Linux** :

* 🖥️ **Desktop Linux** : pour une utilisation quotidienne (graphique)
* 💻 **Serveur Linux** : pour héberger des services (terminal uniquement)
* ☁️ **Machine virtuelle (VM)** : pour tester et apprendre sans risque

Tu apprendras à **identifier ton type d’environnement**,
à **simuler un serveur**,
et à **explorer une vraie interface graphique Linux** directement depuis ton navigateur. 🚀

---

## 🧭 **Étape 1 – Identifier son environnement**

Avant toute chose, observons ton système actuel.
Ouvre ton **terminal Killercoda** (ou ton terminal local) et tape :

```bash
uname -a
lsb_release -a
hostnamectl
```

👉 Ces commandes affichent :

* le **noyau Linux** en cours,
* la **distribution** utilisée,
* et le **type de machine** (physique, virtuelle, serveur…).

💡 Sur Killercoda, tu es dans une **machine virtuelle Linux** :
un environnement idéal pour apprendre sans rien casser !

---

## 🖥️ **Étape 2 – Découvrir le mode Desktop**

Un **Linux Desktop** ressemble à Windows ou macOS :
une interface graphique complète avec des fenêtres, un menu Applications, et des outils accessibles à la souris.

Mais pour vraiment comprendre, lance un **Ubuntu Desktop réel dans ton navigateur** 👇

---

### 🧩 Exploration pratique

<div style="text-align:center; margin: 30px 0;">
  <a href="https://www.onworks.net/runos/create-os.html?os=ubuntu-22.04.3-desktop-amd64&home=init" 
     target="_blank" 
     style="background-color:#2a7ae2; color:white; padding:14px 32px; 
            border-radius:8px; text-decoration:none; font-size:18px; font-weight:bold;">
    🚀 Lancer Ubuntu Desktop
  </a>
  <p style="font-size:14px; color:#666; margin-top:10px;">
    (ouvre une nouvelle fenêtre OnWorks avec <strong>Ubuntu 22.04 Desktop</strong>)
  </p>
</div>

---

### 🧭 À toi de jouer

1️⃣ Clique sur **« Lancer Ubuntu Desktop »**
2️⃣ Patiente quelques secondes le temps du chargement (20–30 s)
3️⃣ Explore :

* Le **menu Applications**
* Le **Gestionnaire de fichiers**
* Le **Terminal** (`Ctrl + Alt + T`)
* Le **Centre de logiciels**
  4️⃣ Tape dans le terminal :

```bash
whoami
ls
pwd
```

👉 Tu retrouves les mêmes commandes vues dans le premier lab !

💡 **Astuce clavier** :
Si le clavier est en QWERTY →
`Settings → Region & Language → Input Sources → Add French (AZERTY)`

---

### 🔍 À retenir

| Avantages du Desktop          | Exemples de distributions               |
| ----------------------------- | --------------------------------------- |
| 🎨 Interface conviviale       | Ubuntu, Mint, Pop!_OS                   |
| 🧰 Outils graphiques complets | Centre de logiciels, Fichiers, Terminal |
| 🔒 Sécurité et simplicité     | Parfait pour particuliers et étudiants  |

---

## 💻 **Étape 3 – Comprendre le mode Serveur**

Un **Serveur Linux** ne possède **aucune interface graphique**.
Tout se fait **en ligne de commande** pour économiser la mémoire et la puissance.

Teste quelques commandes :

```bash
uptime
who
ps aux | grep ssh
systemctl list-units --type=service | head
```

👉 Tu observes :

* depuis combien de temps le système tourne,
* quels utilisateurs sont connectés,
* quels services tournent en arrière-plan (comme SSH).

---

### ⚙️ Pourquoi pas de GUI sur un serveur ?

* Pour **gagner en performance**
* Pour **réduire la surface d’attaque**
* Parce que les admins gèrent le serveur à distance avec **SSH**

💬 Exemple réel :

> Un serveur web à Paris hébergé sur Ubuntu Server peut être administré depuis Alger, Lyon ou Montréal, juste avec la ligne de commande.

---

## ☁️ **Étape 4 – Découvrir la virtualisation**

Une **machine virtuelle (VM)** est un ordinateur complet simulé à l’intérieur d’un autre.

Teste si tu es dans un environnement virtuel :

```bash
lscpu | grep -i hypervisor
dmesg | grep -i virtual
```

👉 Si tu vois des mots comme `KVM`, `VirtualBox` ou `VMware`,
c’est bien une machine virtuelle ! 🎯

---

### 💡 Pourquoi les VMs sont idéales pour apprendre :

* 🧱 **Isolation totale** : tu peux tout casser sans peur
* 🔄 **Facile à réinitialiser**
* 💰 **Aucun coût matériel**
* 🧪 **Parfait pour les labs Formip** et la certification ENI

---

## 🧩 **Étape 5 – Faire le bon choix**

Compare les trois modes d’installation :

| Critère        | Desktop             | Serveur                 | Machine Virtuelle |
| -------------- | ------------------- | ----------------------- | ----------------- |
| Interface      | Graphique (GUI)     | Ligne de commande (CLI) | Selon besoin      |
| Usage typique  | Bureautique, études | Hébergement, services   | Formation, test   |
| Difficulté     | Facile              | Avancée                 | Facile            |
| Sécurité       | Standard            | Élevée                  | Très élevée       |
| Idéal pour toi | ✅                   | ❌                       | ✅✅✅               |

---

## 🎓 **Résumé du lab**

✅ **Desktop** : le Linux du quotidien
✅ **Serveur** : le Linux des pros
✅ **VM** : le Linux de l’apprentissage

👉 Pour la formation et la certification ENI,
le **mode Machine Virtuelle** est **le plus recommandé** :
sécurisé, flexible et parfait pour expérimenter ! 🧠🐧

---

## 🏁 **Mission accomplie !**

🎉 Bravo ! Tu comprends maintenant :

* les **3 types d’installation Linux**
* leur **usage et leurs différences**
* et surtout **le bon choix pour toi** en tant qu’apprenant Formip !

---

### 💬 Pour aller plus loin

🔗 [**Lancer Ubuntu Desktop à nouveau**](https://www.onworks.net/runos/create-os.html?os=ubuntu-22.04.3-desktop-amd64&home=init)
📘 Reviens ici après ton exploration pour passer au **chapitre suivant : le processus de démarrage et les services.**
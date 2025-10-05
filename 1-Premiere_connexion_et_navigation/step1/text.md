# 🚀 Étape 1 — Qui suis-je dans ce système ?

Sous Linux, chaque utilisateur a **sa propre identité numérique**.  
C’est comme une carte d’accès personnelle : elle détermine **ce que vous pouvez faire** sur le système.  
Découvrons ensemble **qui vous êtes**, comment Linux vous reconnaît, et pourquoi cela compte !

---

## 🪪 1) Votre nom d’utilisateur — le badge visible

Tapez :

```bash
whoami
```{{exec}}

**Attendu :** un mot comme `learner`, `ubuntu`, ou votre identifiant personnel.  

👉 Cette commande répond à la question philosophique (et très utile) :  
> “Qui suis-je pour Linux ?”

Linux vous répondra simplement par votre **nom d’utilisateur**.  
C’est le **nom de votre compte** sur la machine.

💡 **Pourquoi c’est utile ?**
- Pour vérifier **sous quelle identité** vous travaillez (important après un `sudo` ou un `su`).
- Pour éviter d’effectuer une commande sensible avec le mauvais compte (par exemple root 😅).

---

## 🧾 2) Votre carte d’identité complète — le profil technique

Tapez :

```bash
id
```{{exec}}

**Exemple de sortie :**

````

uid=1000(learner) gid=1000(learner) groups=1000(learner),27(sudo)

````

Décodons ensemble ce que vous voyez 👇

| Élément | Signification | Exemple |
|----------|----------------|----------|
| **uid** | Numéro d’utilisateur (User ID) | `1000` → vous êtes un utilisateur humain |
| **gid** | Numéro de votre groupe principal | `1000` → souvent le même nom que votre compte |
| **groups** | Tous vos groupes d’appartenance | `sudo`, `video`, `audio`, etc. |

💡 **Pourquoi c’est utile ?**
- Pour comprendre **vos permissions** (lecture, écriture, exécution).
- Pour savoir **si vous êtes administrateur** (`sudo` apparaît dans vos groupes).
- Pour diagnostiquer des **problèmes d’accès** à des fichiers ou programmes.

🔍 **Astuce pro :**
Vous pouvez aussi interroger un autre utilisateur :
```bash
id root
````

Cela affiche la carte d’identité du compte administrateur.

---

## 👥 3) Vos “clubs” (groupes d’appartenance)

Tapez :

```bash
groups
```{{exec}}


**Exemple de sortie :**

```

learner sudo

```

Chaque utilisateur peut appartenir à **plusieurs groupes**, un peu comme les départements d’une entreprise :
- `sudo` → le club des administrateurs  
- `video` → accès aux périphériques vidéo  
- `audio` → accès au son  
- `users` → le groupe de base de tous les utilisateurs  

💡 **Pourquoi c’est utile ?**
- Les groupes déterminent **ce que vous pouvez faire sans être root**.
- Si une commande vous dit “Permission denied”, vérifiez d’abord vos **groupes**.

---

## 🧠 Comprendre le “Pourquoi”

Linux est **multi-utilisateurs** par nature :  
plusieurs personnes peuvent se connecter **en même temps** sur la même machine, chacune avec ses droits.

C’est ce modèle d’identités et de permissions qui rend Linux :
- 🧱 **Solide** (chaque utilisateur est isolé)
- 🔒 **Sécurisé** (personne ne peut tout faire sans autorisation)
- 👨‍💻 **Professionnel** (idéal pour les serveurs multi-comptes)

---

## 🆘 Si ça coince

- 🟡 **Rien ne s’affiche ?**  
  Assurez-vous d’avoir bien appuyé sur **Entrée** après la commande.

- 🔴 **Message “command not found” ?**  
  Vérifiez la **syntaxe exacte** :  
  → `whoami`, `id`, `groups` (tout en minuscules).

- 🔵 **Le terminal affiche trop vite ?**  
  Tapez à nouveau la commande pour bien observer le résultat.

---

## 🎯 En résumé

| Commande | Ce qu’elle fait | Pourquoi elle est utile |
|-----------|----------------|-------------------------|
| `whoami` | Affiche votre nom d’utilisateur | Vérifier votre identité actuelle |
| `id` | Donne tous vos identifiants et groupes | Comprendre vos permissions |
| `groups` | Montre vos groupes d’appartenance | Diagnostiquer vos accès |

🧩 Ces trois commandes sont vos **bases d’identité Linux**.  
Elles vous permettent de savoir **qui vous êtes**, **ce que vous pouvez faire**, et **à quel groupe vous appartenez**.

👉 C’est la première étape de tout administrateur Linux : **se connaître soi-même dans le système.**


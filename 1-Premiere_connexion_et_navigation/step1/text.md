# 🚀 Étape 1 — Qui suis-je dans ce système ?

Dans Linux, chaque action dépend de **qui vous êtes**. Découvrons votre identité.

---

## 1) Votre nom d’utilisateur

```plain
whoami
```{{exec}}

**Attendu :** un mot qui ressemble à `learner`, `ubuntu`, ou votre identifiant.

---

## 2) Votre carte d’identité complète

```bash
id
```{{exec}}

**Exemple de sortie :**

```
uid=1000(learner) gid=1000(learner) groups=1000(learner),27(sudo)
```

* `uid=` : votre numéro d’utilisateur (unique)
* `gid=` : votre groupe principal
* `groups=` : tous les groupes auxquels vous appartenez

---

## 3) Vos “clubs” (groupes)

```bash
groups
```

**Exemple :**

```
learner sudo
```

---

### 🧠 Pourquoi c’est important ?

Linux est **multi-utilisateurs**. Vos permissions (droit de lire/écrire/exécuter) dépendent de **votre identité** et de **vos groupes**.

### 🆘 Si ça coince

* Rien ne s’affiche ? Vérifiez que vous avez bien **appuyé sur Entrée** après la commande.
* Message “command not found” ? Assurez-vous d’avoir **exactement** tapé `whoami`, `id`, `groups` (sans majuscules).

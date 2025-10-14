# 👑 Étape 1 — Racines du pouvoir : root & UID 0

Sous Linux, ce n’est pas le nom qui compte, c’est **l’UID**. L’UID **0** = pouvoir absolu.

Vérifiez qui vous êtes :
```bash
whoami
id
````

Observez root :

```bash
id root
getent passwd root
```

Astuce : `uid=0(root)` est la vraie clé.
Testez une élévation ponctuelle (sans changer d’utilisateur) :

```bash
sudo id
```

💡 Si la ligne affiche `uid=0`, vous avez **emprunté** le pouvoir — proprement.

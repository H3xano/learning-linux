# 👑 Étape 1 — Racines du pouvoir : root & UID 0

Dans l’univers Linux, le véritable sésame n’est pas le nom de l’utilisateur, mais son **UID** (User ID). Celui qui porte l’UID **0** détient tous les privilèges : c’est `root`.

Commence par vérifier sous quelle identité tu travailles :
```bash
whoami
```
Tu dois voir s’afficher ton nom d’utilisateur courant. Cela confirme depuis quel compte tu découvres les commandes suivantes.

Demande ensuite plus de détails sur ton profil :
```bash
id
```
Observe la partie `uid=…`. Si la valeur est différente de `0`, tu n’es pas root, ce qui est normal sur un poste de travail sécurisé.

À présent, regarde comment le système décrit l’utilisateur root :
```bash
id root
```
Tu devrais obtenir une ligne indiquant `uid=0(root)`. C’est le signe que `root` possède bien l’UID 0 et, par extension, tous les pouvoirs.

Termine cette observation en consultant l’entrée complète de root dans la base des comptes :
```bash
getent passwd root
```
La sortie rappelle le dossier personnel, le shell par défaut et d’autres attributs utiles.

Pour goûter brièvement aux privilèges du super-utilisateur, lance une commande avec `sudo` :
```bash
sudo id
```
Entre ton mot de passe si nécessaire, puis vérifie que la sortie indique `uid=0`. Tu viens d’« emprunter » l’identité de root le temps d’une commande, sans changer complètement d’utilisateur.

💡 Moralité : retiens que `uid=0` est l’indice ultime de l’autorité, peu importe le nom affiché.

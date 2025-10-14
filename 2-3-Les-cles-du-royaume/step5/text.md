# 🔍 Étape 5 — Sécurité & audit : voir, compter, alerter

Sur Debian et Ubuntu, les traces laissées par `sudo` se trouvent dans `/var/log/auth.log`. L’objectif est d’apprendre à les lire et à produire un court rapport d’activité.

Commence par suivre en direct ce qui se passe (arrête la commande avec `Ctrl+C` quand tu as terminé) :
```bash
sudo tail -f /var/log/auth.log | grep sudo
```
Chaque nouvelle action `sudo` apparaîtra immédiatement. Cela permet de voir qui demande quoi et à quel moment.

Pour mesurer l’activité passée, compte le nombre de commandes exécutées via `sudo` :
```bash
sudo grep "COMMAND=" /var/log/auth.log | wc -l
```
La valeur renvoyée indique le volume d’actions privilégiées enregistrées dans tes logs.

Identifie ensuite les tentatives refusées récemment :
```bash
sudo grep "NOT in sudoers" /var/log/auth.log | tail -n 5
```
Tu obtiens les cinq dernières entrées indiquant qu’un utilisateur non autorisé a tenté d’employer `sudo`.

Pour conclure, rassemble quelques informations clés dans un mini-rapport. Commence par y inscrire ton identité :
```bash
whoami > rapport_2_3.txt
```
Ensuite, complète le fichier avec la liste de tes permissions `sudo` :
```bash
sudo -l >> rapport_2_3.txt
```
Ajoute enfin l’horodatage de la collecte :
```bash
date >> rapport_2_3.txt
```

Vérifie le contenu généré :
```bash
cat rapport_2_3.txt
```
Confirme que les informations essentielles y figurent et conserve le fichier si tu dois le remettre à un formateur.

💡 Mettre en place une routine d’audit prévient les abus et renforce la posture de sécurité de ton équipe.

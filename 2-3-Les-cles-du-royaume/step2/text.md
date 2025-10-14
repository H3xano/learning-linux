# 🛡️ Étape 2 — Sudo : élévation propre et traçable

`sudo` te prête les privilèges de root pour **une seule commande**, tout en conservant une trace claire dans les journaux système.

Commence par rafraîchir ta session sudo :
```bash
sudo -v
```
Cette commande demande ton mot de passe si nécessaire et enregistre le fait que tu es autorisé à utiliser `sudo` pendant quelques minutes.

Vérifie ensuite quelle identité exécuterait une commande élevée :
```bash
sudo whoami
```
La sortie doit afficher `root`, preuve que `sudo` s’exécute avec les droits du super-utilisateur.

Teste l’exécution sous un autre compte sans mot de passe dédié :
```bash
sudo -u nobody id
```
Ici, `sudo` bascule temporairement vers l’utilisateur `nobody`. Observe l’UID dans la sortie pour confirmer le changement.

Découvre enfin ce que ton compte est autorisé à faire :
```bash
sudo -l
```
La liste obtenue détaille les commandes que tu peux lancer avec `sudo`, ainsi que d’éventuelles restrictions.

Quand tu as fini, verrouille le cache de sécurité :
```bash
sudo -k
```
Cela oblige `sudo` à redemander ton mot de passe la prochaine fois, évitant qu’une autre personne profite de ta session ouverte.

💡 Retiens que `sudo` protège autant le système que toi : il est ponctuel, ciblé et entièrement journalisé.

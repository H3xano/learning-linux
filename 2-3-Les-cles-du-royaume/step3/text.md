# 🎭 Étape 3 — su : quand (ne pas) changer de costume

`su` (substitute user) ouvre une **nouvelle session** sous l’identité d’un autre compte, généralement `root`. Cela ressemble à changer complètement de costume.

Commence par vérifier que la commande existe bien sur ta machine :
```bash
which su
```
La sortie indique le chemin vers l’exécutable, preuve qu’il est disponible.

Jette ensuite un œil à son manuel pour repérer les principales options :
```bash
man su | head -n 5
```
Les premières lignes rappellent l’objectif de `su` et les options les plus courantes.

Sur beaucoup de distributions modernes, le compte root n’a pas de mot de passe distinct :
```bash
su
```
Si tu obtiens un message d’échec, c’est attendu ; la stratégie consiste à passer par `sudo` plutôt que d’ouvrir une session root directe.

Pour comparer, ouvre un shell root complet avec l’environnement de root :
```bash
sudo -i
```
Tu remarqueras que le prompt change. Quitte ce shell avec `exit`.

Teste aussi un shell root qui conserve ton environnement utilisateur :
```bash
sudo -s
```
Ici, seules les permissions changent ; les variables de ton utilisateur restent en place. Quitte à nouveau avec `exit`.

💡 Best practice : privilégie `sudo` pour les actions ponctuelles. Réserve `su -` aux cas de maintenance où une session root complète est indispensable.

Pour collaborer, il faut des équipes. Sous Linux, une équipe est un **groupe**. Apprenons à les gérer.

### Créer et supprimer un groupe

La commande `groupadd` crée un groupe. Créons un groupe temporaire `marketing`.

`sudo groupadd marketing`{{execute}}

Vérifions son existence avec `getent group`.

`getent group marketing`{{execute}}

Pour le supprimer, on utilise `groupdel`.

`sudo groupdel marketing`{{execute}}

---
### Ajouter un membre à un groupe

Maintenant, créons le groupe `webteam` pour notre projet.

`sudo groupadd webteam`{{execute}}

Pour ajouter notre utilisateur `learner` à ce groupe, on utilise `usermod -aG`.

`sudo usermod -aG webteam learner`{{execute}}

<br>
> ⚠️ **ATTENTION : Le Piège à Éviter !**
> L'option `-a` (append/ajouter) est **CRUCIALE**.
>
> - `usermod -aG webteam learner` **AJOUTE** `webteam` aux groupes existants. C'est ce que vous voulez 99% du temps.
> - `usermod -G webteam learner` (sans `-a`) **ÉCRASE** tous les anciens groupes et ne laisse que `webteam`. C'est une erreur fréquente et dangereuse !

Pour que votre nouvelle appartenance au groupe soit active, vous devriez normalement vous déconnecter et vous reconnecter.
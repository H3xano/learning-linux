Le serveur semble lent ? Votre premier réflexe doit être `top` ou, mieux encore, `htop`. C'est le gestionnaire des tâches de Linux.

`htop` est une version améliorée et plus intuitive de `top`. Lançons-le.

`htop`{{execute T1}}

**Observez le cockpit :**
-   **En haut** : Des barres graphiques pour chaque cœur CPU, la mémoire (Mem) et le swap.
-   **La liste** : Les processus triés par défaut par utilisation CPU.

**Actions à tester dans `htop` :**
1.  Appuyez sur **`F6`** puis utilisez les flèches pour trier par `PERCENT_MEM` et appuyez sur Entrée. Vous voyez maintenant les processus les plus gourmands en mémoire.
2.  Appuyez sur **`F5`** pour activer la vue en "arbre". Vous voyez maintenant la hiérarchie des processus (qui a lancé qui).
3.  Appuyez à nouveau sur **`F5`** pour revenir à la vue normale.
4.  Appuyez sur **`F3`** et tapez `bash` pour chercher votre propre processus shell.
5.  Appuyez sur **`F10`** ou **`q`** pour quitter.

---
### Mettre `htop` à l'épreuve

Pour voir `htop` en action, simulons un processus qui consomme 100% d'un cœur CPU. La commande `yes` envoie un "y" en continu, ce qui est parfait pour ce test. Le `&` à la fin le lance en arrière-plan.

`yes > /dev/null &`{{execute T1}}

Retournez immédiatement dans `htop` (s'il n'est pas déjà ouvert). Votre mission : trouvez le processus `yes` qui doit être tout en haut de la liste, consommant un cœur CPU entier !

Une fois que vous l'avez repéré, vous pouvez l'arrêter proprement avec la commande `killall`.

`killall yes`{{execute T1}}

Observez dans `htop` : le processus a disparu et la charge CPU est revenue à la normale.
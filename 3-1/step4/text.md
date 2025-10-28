C'est LA commande préférée des administrateurs système. L'option `-f` (pour *follow*) transforme `tail` en une tour de contrôle. Elle affiche les dernières lignes, puis **attend et affiche chaque nouvelle ligne qui est ajoutée au fichier, en direct !**

Pour simuler cela, un script en arrière-plan écrit dans le fichier `live_stream.log` toutes les quelques secondes.

Lançons la surveillance :

`tail -f live_stream.log`{{execute}}

Regardez votre terminal... 😮 De nouvelles lignes apparaissent automatiquement ! C'est parfait pour surveiller des logs d'application, des accès à un serveur web, etc.

Pour arrêter la surveillance, cliquez sur le bouton **`clear`** ou faites **`Ctrl+C`**.

> **Astuce de pro : `tail -F`**
> Dans un vrai serveur, les fichiers de logs sont souvent archivés et recréés (un processus appelé "rotation"). Si cela arrive, `tail -f` peut s'arrêter de fonctionner. Pour éviter cela, les pros utilisent `tail -F` (avec un F majuscule). Cette version est plus robuste car elle surveille le nom du fichier et pas seulement le fichier lui-même. Pensez-y pour le futur !

---

### Filtrer le flux en direct

La vraie magie opère quand on combine `tail -f` avec d'autres commandes comme `grep`. Notre log simulé contient des messages "INFO" et "ERROR".

Imaginons que nous voulons voir **uniquement les erreurs**, en temps réel. C'est simple :

`tail -f live_stream.log | grep "ERROR"`{{execute}}

Maintenant, seules les lignes contenant le mot "ERROR" s'affichent ! Vous venez de créer un système d'alerte en une seule ligne de commande. C'est l'essence même de la puissance de Linux.

N'oubliez pas de faire **`Ctrl+C`** pour arrêter la commande.
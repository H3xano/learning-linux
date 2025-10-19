# Étape 2 : `file` et `stat` - La véritable identité des fichiers

Le nom d'un fichier peut être trompeur. Pour connaître sa vraie nature, on utilise `file` et `stat`.

Un fichier nommé `image_suspecte.jpg` a été créé pour vous.

### `file` : L'analyseur d'ADN

La commande `file` ne regarde pas l'extension, mais le contenu du fichier pour déterminer son type. Analysons notre image suspecte.

`file image_suspecte.jpg`{{execute}}

**Révélation !** Ce n'est pas une image JPEG, mais un simple fichier texte ASCII. `file` n'a pas été trompé par le nom. C'est un outil de sécurité essentiel.

---

### `stat` : Le dossier médical complet

La commande `stat` vous donne toutes les métadonnées d'un fichier : permissions, propriétaire, et surtout, les dates précises.

`stat image_suspecte.jpg`{{execute}}

Regardez les trois dates :
-   **Access (`atime`)** : Dernière lecture.
-   **Modify (`mtime`)** : Dernière modification du *contenu*.
-   **Change (`ctime`)** : Dernière modification des *métadonnées* (comme les permissions).

Changeons les permissions du fichier et observons ce qui se passe.

`chmod 777 image_suspecte.jpg`{{execute}}

Maintenant, ré-inspectons le fichier avec `stat`.

`stat image_suspecte.jpg`{{execute}}

Vous voyez que la date **Change (ctime)** a été mise à jour, mais la date **Modify (mtime)** n'a pas bougé, car le contenu du fichier est resté le même !
# Étape 2 : `iotop` - Le Radar à Disque

Parfois, le CPU et la RAM sont calmes, mais le système est lent. Le coupable ? Le disque ! La commande `iotop` vous montre en temps réel quels processus sont en train de lire ou d'écrire sur le disque.

`iotop` nécessite des privilèges root, nous utiliserons donc `sudo`.

`sudo iotop`{{execute T1}}

**Observez le radar :**
-   **En haut** : La vitesse totale de lecture (`DISK READ`) et d'écriture (`DISK WRITE`) sur le disque.
-   **La liste** : Les processus avec leur vitesse de lecture et d'écriture individuelle.

Pour simuler une forte activité d'écriture, nous allons créer un gros fichier dans un autre terminal.

**Dans le terminal 2 (à droite) :**
`dd if=/dev/zero of=gros_fichier bs=1M count=200`{{execute T2}}

**Regardez le terminal 1 !** Vous devriez voir le processus `dd` apparaître en tête de liste avec une vitesse d'écriture élevée.

Une fois la commande `dd` terminée, son activité dans `iotop` disparaît. C'est l'outil parfait pour trouver qui "massacre" votre disque.

Appuyez sur `q` dans le terminal 1 pour quitter `iotop`.
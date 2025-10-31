Un admin prévoyant effectue une maintenance régulière. Cela inclut la surveillance de l'espace disque et l'automatisation des sauvegardes.

### 1. Maintenance Préventive : Vérifier l'Espace Disque

Avant de lancer une sauvegarde, vérifions l'espace disponible. Un disque plein peut causer des pannes silencieuses.

`df -h`{{execute}}

Le disque n'est pas plein, mais un bon admin cherche proactivement ce qui consomme de l'espace. Identifions les plus gros dossiers dans `/var`.

`sudo du -sh /var/* | sort -rh | head -n 5`{{execute}}

Le dossier `/var/log` semble suspect. Regardons à l'intérieur. Vous remarquerez un gros fichier `access.log.old` (1 Go !) qui peut être nettoyé.

`sudo ls -lh /var/log/nginx/`{{execute}}
`sudo rm /var/log/nginx/access.log.old`{{execute}}

Vous venez de libérer de l'espace vital, une tâche de maintenance essentielle.

---
### 2. Le Filet de Sécurité : Créer un Script de Sauvegarde

Maintenant que le serveur est propre, créons un script qui archive notre site web.

`nano backup_site.sh`{{execute}}

Copiez ce script professionnel dans `nano` :

```bash
#!/bin/bash

# --- Configuration ---
SOURCE_DIR="/var/www/html"
BACKUP_DIR="/var/backups/website"
DATE=$(date +%Y-%m-%d_%H%M%S)
ARCHIVE_FILE="$BACKUP_DIR/mon_app-$DATE.tar.gz"
RETENTION_DAYS=7

# --- Exécution ---
echo "Démarrage de la sauvegarde de $SOURCE_DIR..."
mkdir -p "$BACKUP_DIR"
tar -czf "$ARCHIVE_FILE" "$SOURCE_DIR"

if [ $? -eq 0 ]; then
    echo "Sauvegarde créée avec succès : $ARCHIVE_FILE"
else
    echo "Erreur lors de la création de la sauvegarde."
    exit 1
fi

echo "Suppression des sauvegardes de plus de $RETENTION_DAYS jours..."
find "$BACKUP_DIR" -type f -name "mon_app-*.tar.gz" -mtime +$RETENTION_DAYS -delete
echo "Sauvegarde et rotation terminées."
```
Sauvegardez (`Ctrl+O`, Entrée) et quittez (`Ctrl+X`).

Rendez le script exécutable et lancez-le avec `sudo`.
`chmod +x backup_site.sh`{{execute}}
`sudo ./backup_site.sh`{{execute}}

Vérifiez que l'archive a bien été créée.
`sudo ls -l /var/backups/website`{{execute}}
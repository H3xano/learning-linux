# Étape 4 : Automatiser la Sauvegarde

Un admin prévoyant automatise ses sauvegardes. Créons un script qui archive notre site web.

`nano backup_site.sh`{{execute}}

Copiez ce script professionnel dans `nano`. Il est commenté pour que vous compreniez chaque étape.

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

# Crée le dossier de backup s'il n'existe pas
mkdir -p "$BACKUP_DIR"

# Crée l'archive
tar -czf "$ARCHIVE_FILE" "$SOURCE_DIR"

# Vérifie si la sauvegarde a réussi
if [ $? -eq 0 ]; then
    echo "Sauvegarde créée avec succès : $ARCHIVE_FILE"
else
    echo "Erreur lors de la création de la sauvegarde."
    exit 1
fi

# Fait la rotation des anciennes sauvegardes
echo "Suppression des sauvegardes de plus de $RETENTION_DAYS jours..."
find "$BACKUP_DIR" -type f -name "mon_app-*.tar.gz" -mtime +$RETENTION_DAYS -delete

echo "Sauvegarde et rotation terminées."
```
Sauvegardez (`Ctrl+O`, Entrée) et quittez (`Ctrl+X`).

---
### Exécuter et automatiser

Rendez le script exécutable et lancez-le avec `sudo` car il doit lire `/var/www/html` et écrire dans `/var/backups`.

`chmod +x backup_site.sh`{{execute}}
`sudo ./backup_site.sh`{{execute}}

Vérifiez que l'archive a bien été créée.
`sudo ls -l /var/backups/website`{{execute}}

Pour automatiser cela tous les jours à 2h du matin, un admin ajouterait cette ligne à son `crontab` :
`0 2 * * * /home/learner/backup_site.sh`
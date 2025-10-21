#!/bin/bash

# Arrête le script si une commande échoue
set -e

# --- 1. Vérification des arguments ---
# On s'assure qu'un nom de dossier a bien été fourni en paramètre.
if [ -z "$1" ]; then
    echo "❌ Erreur : Vous devez fournir le nom du dossier du lab en paramètre."
    echo "Usage: ./flatten_lab.sh <nom_du_dossier_lab>"
    exit 1
fi

# --- 2. Préparation des variables ---
LAB_DIR=$1
OUTPUT_FILE="${LAB_DIR}_contexte_complet.txt"

# On vérifie que le dossier du lab existe bien.
if [ ! -d "$LAB_DIR" ]; then
    echo "❌ Erreur : Le dossier '$LAB_DIR' n'a pas été trouvé."
    exit 1
fi

# --- 3. Création du fichier de contexte ---
echo "⚙️  Génération du contexte pour le lab '$LAB_DIR'..."

# On vide le fichier de sortie pour s'assurer qu'on repart de zéro.
> "$OUTPUT_FILE"

# On cherche tous les fichiers (-type f) dans le dossier du lab et ses sous-dossiers.
# On trie les résultats pour avoir un ordre cohérent (intro, step1, step2, etc.).
# Puis on boucle sur chaque fichier trouvé.
find "$LAB_DIR" -type f | sort | while read -r filepath; do
    # On récupère le chemin relatif pour que ce soit plus propre (ex: "intro.md" au lieu de "lab_machin/intro.md")
    relative_path=$(echo "$filepath" | sed "s|^$LAB_DIR/||")

    # On ajoute un séparateur clair avec le nom du fichier dans le fichier de sortie.
    echo "========================================================================" >> "$OUTPUT_FILE"
    echo " Fichier : $relative_path" >> "$OUTPUT_FILE"
    echo "========================================================================" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE" # Ligne vide pour aérer

    # On ajoute le contenu du fichier actuel au fichier de sortie.
    cat "$filepath" >> "$OUTPUT_FILE"

    # On ajoute deux lignes vides pour bien séparer les fichiers.
    echo -e "\n\n" >> "$OUTPUT_FILE"
done

# --- 4. Message de confirmation ---
echo "✅ Terminé ! Le contexte complet a été sauvegardé dans : $OUTPUT_FILE"
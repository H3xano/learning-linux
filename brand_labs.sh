#!/bin/bash
#
# Script pour standardiser les fichiers intro.md et finish.md des labs.
# 1. Assure que chaque fichier commence par la ligne de branding Formip.
# 2. Supprime le titre Markdown initial (# ...) des fichiers intro.md.
#
# Utilisation : Placer ce script à la racine du projet et l'exécuter.
# ./brand_labs.sh

# Pour une exécution plus robuste
set -euo pipefail

# La ligne de branding attendue au début de chaque fichier
BRANDING_LINE="![Formip](../assets/formip_logo_padded.png)"

# --- Début du Script ---

echo "🔍 Recherche des fichiers intro.md et finish.md à traiter..."

# Utilise 'find' pour lister tous les fichiers concernés
# et une boucle 'while' pour les traiter un par un de manière sécurisée.
find . -type f \( -name "intro.md" -o -name "finish.md" \) | while IFS= read -r file; do
    echo "---------------------------------"
    echo " Fichier : $file"

    # --- Étape 1 : Traitement spécial pour intro.md ---
    # Vérifie si c'est un fichier intro.md
    if [[ "$file" == *intro.md ]]; then
        # Lit la première ligne du fichier
        FIRST_LINE=$(head -n 1 "$file" || true)

        # Si la première ligne est un titre Markdown (commence par '#')
        if [[ "$FIRST_LINE" == \#* ]]; then
            # Supprime la première ligne sur place avec 'sed -i'
            sed -i '1d' "$file"
            echo "   ✅ Titre initial supprimé de intro.md"
        fi
    fi

    # --- Étape 2 : Vérification et ajout du branding pour tous les fichiers ---
    # Relit la première ligne (elle a pu changer si on a supprimé le titre)
    CURRENT_FIRST_LINE=$(head -n 1 "$file" || true)

    # Si la première ligne actuelle N'EST PAS la ligne de branding
    if [ "$CURRENT_FIRST_LINE" != "$BRANDING_LINE" ]; then
        # Insère la ligne de branding au tout début du fichier
        # sed -i '1i ...' insère le texte AVANT la ligne 1.
        # On utilise une variable pour éviter les problèmes de caractères spéciaux.
        sed -i "1i\\$BRANDING_LINE" "$file"
        echo "   ✅ Ligne de branding Formip ajoutée."
    else
        echo "   👍 Branding déjà présent."
    fi
done

echo "---------------------------------"
echo "🎉 Opération terminée avec succès !"
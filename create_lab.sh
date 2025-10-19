#!/bin/bash
#
# Script pour générer rapidement l'arborescence d'un nouveau lab Killercoda.
#

# --- Couleurs pour un affichage plus sympa ---
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}--- Générateur de Lab Formip pour Killercoda ---${NC}"

# --- Demander les informations ---
read -p "$(echo -e ${YELLOW}"Entrez un nom court pour le lab (ex: 4.5-recherche-fichiers): "${NC})" LAB_SLUG
read -p "$(echo -e ${YELLOW}"Combien de steps ce lab contiendra-t-il ? (ex: 4): "${NC})" NUM_STEPS

# --- Validation des entrées ---
if [[ -z "$LAB_SLUG" || ! "$NUM_STEPS" =~ ^[0-9]+$ || "$NUM_STEPS" -eq 0 ]]; then
    echo -e "\nErreur : Le nom du lab et un nombre valide de steps sont obligatoires."
    exit 1
fi

if [ -d "$LAB_SLUG" ]; then
    echo -e "\nErreur : Le dossier '$LAB_SLUG' existe déjà. Veuillez choisir un autre nom."
    exit 1
fi

echo -e "\n${GREEN}Création de l'arborescence pour le lab '$LAB_SLUG' avec $NUM_STEPS steps...${NC}\n"

# --- Création du dossier principal ---
mkdir -p "$LAB_SLUG"

# --- Création des fichiers racine avec du contenu de base ---

# index.json
# On prépare la structure et on ajoutera les steps à la fin.
cat << EOF > "$LAB_SLUG/index.json"
{
  "title": "Titre du Lab",
  "description": "Description du lab.",
  "backend": {
    "imageid": "ubuntu",
    "user": "learner"
  },
  "details": {
    "intro": {
      "text": "intro.md",
      "background": "background.sh",
      "foreground": "foreground.sh"
    },
    "steps": [
      __STEPS_PLACEHOLDER__
    ],
    "finish": {
      "text": "finish.md"
    }
  }
}
EOF

# intro.md
echo "# 🐧 Titre de l'Introduction" > "$LAB_SLUG/intro.md"

# finish.md
echo "# 🏆 Mission Accomplie !" > "$LAB_SLUG/finish.md"

# background.sh
cat << EOF > "$LAB_SLUG/background.sh"
#!/bin/bash
set -euo pipefail
# Script de préparation de l'environnement (création de fichiers, etc.)
EOF
chmod +x "$LAB_SLUG/background.sh"

# foreground.sh
cat << EOF > "$LAB_SLUG/foreground.sh"
#!/bin/bash
set -euo pipefail
# Script d'accueil (bannière, etc.)
su - learner 
cd ~
bash /tmp/banner.sh
EOF
chmod +x "$LAB_SLUG/foreground.sh"

# --- Boucle pour créer les steps ---
STEPS_JSON=""
for i in $(seq 1 $NUM_STEPS)
do
    STEP_DIR="$LAB_SLUG/step$i"
    mkdir -p "$STEP_DIR"

    # text.md
    echo "# Étape $i : Titre de l'étape" > "$STEP_DIR/text.md"

    # verify.sh
    cat << EOF > "$STEP_DIR/verify.sh"
#!/bin/bash
set -e
FILES=("\$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="\$1"; for f in "\${FILES[@]}"; do [ -f "\$f" ] && grep -q "\$p" "\$f" && return 0; done; return 1; }

# Vérification pour l'étape $i
# found 'une_commande' || exit 1

echo -n "done"
EOF
    chmod +x "$STEP_DIR/verify.sh"
    echo "  - Étape $i créée."

    # Préparer le bloc JSON pour ce step
    STEP_BLOCK="{\n        \"title\": \"Étape $i\",\n        \"text\": \"step$i/text.md\",\n        \"verify\": \"step$i/verify.sh\"\n      }"

    if [ -z "$STEPS_JSON" ]; then
        STEPS_JSON="      $STEP_BLOCK"
    else
        STEPS_JSON="$STEPS_JSON,\n      $STEP_BLOCK"
    fi
done

# --- Remplacer le placeholder dans index.json ---
# sed a besoin que les nouvelles lignes soient échappées correctement selon l'OS
# Une méthode plus portable est d'utiliser awk ou perl, mais pour un script rapide,
# un simple remplacement de chaîne de caractères est souvent suffisant.
# On utilise une astuce pour lire le contenu dans une variable.
STEPS_CONTENT=$(echo -e "$STEPS_JSON")
sed -i "s|__STEPS_PLACEHOLDER__|$STEPS_CONTENT|g" "$LAB_SLUG/index.json"


echo -e "\n${GREEN}Arborescence du lab créée avec succès dans le dossier '$LAB_SLUG' !${NC}\n"

# Affiche l'arborescence si la commande 'tree' est disponible
if command -v tree &> /dev/null
then
    tree "$LAB_SLUG"
else
    ls -R "$LAB_SLUG"
fi
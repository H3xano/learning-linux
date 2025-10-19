# Étape 2 : Vim (Partie 1) - Le Choc des Modes

Bienvenue dans `vim`. La première chose à comprendre est son concept de **MODES**. C'est ce qui le rend si différent.

Ouvrons un fichier de configuration.

`vim config_template.txt`{{execute}}

Essayez de taper du texte. Rien ne s'écrit ! C'est normal. Vous êtes en **Mode Normal**, où chaque touche est une commande.

### Passer en Mode Insertion

Pour écrire du texte, vous devez passer en **Mode Insertion**.
1.  Appuyez sur la touche `i` (pour **i**nsert).
2.  Regardez en bas à gauche de l'écran. Vous devriez voir `-- INSERT --`.

Vous y êtes ! Maintenant, vous pouvez taper normalement.

**Votre mission :**
1.  Passez en Mode Insertion en appuyant sur `i`.
2.  Allez à la fin du fichier et ajoutez une nouvelle ligne : `enabled = true`
3.  **TRÈS IMPORTANT :** Appuyez sur la touche **`Esc`** (Échap) pour revenir en **Mode Normal**.

Vous avez réussi le plus difficile : comprendre comment basculer entre le mode commande (Normal) et le mode écriture (Insertion). Ne quittez pas `vim`, nous allons apprendre à sauvegarder à la prochaine étape !
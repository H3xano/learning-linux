# Étape 1 : Le Mode Symbolique - Parler aux Permissions

Le mode symbolique de `chmod` est le plus intuitif. Il utilise des lettres pour dire qui est concerné, quelle action faire, et quelle permission changer.

-   **Qui ?** `u` (user), `g` (group), `o` (others), `a` (all).
-   **Action ?** `+` (ajouter), `-` (retirer), `=` (définir exactement).
-   **Permission ?** `r` (read), `w` (write), `x` (execute).

Un script `mon_script.sh` a été créé pour vous. Regardons ses permissions.

`ls -l mon_script.sh`{{execute}}

Il est en `-rw-r--r--`. Il n'est pas exécutable. Essayons de le lancer.

`./mon_script.sh`{{execute}}

**Permission denied !** C'est normal. Utilisons `chmod` pour **ajouter** (`+`) la permission d'**exécution** (`x`) pour le **propriétaire** (`u`).

`chmod u+x mon_script.sh`{{execute}}

Vérifions à nouveau. Le `x` est apparu !

`ls -l mon_script.sh`{{execute}}
`./mon_script.sh`{{execute}}

Maintenant, **retirons** (`-`) la permission de **lecture** (`r`) pour les **autres** (`o`) sur le fichier `secret.txt`.

`chmod o-r secret.txt`{{execute}}
`ls -l secret.txt`{{execute}}
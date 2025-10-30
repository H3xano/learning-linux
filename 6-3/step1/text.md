Le mode symbolique de `chmod` est le plus intuitif. Il utilise des lettres pour dire qui est concerné, quelle action faire, et quelle permission changer.

-   **Qui ?** `u` (user), `g` (group), `o` (others), `a` (all).
-   **Action ?** `+` (ajouter), `-` (retirer), `=` (définir exactement).
-   **Permission ?** `r` (read), `w` (write), `x` (execute).

Un script `mon_script.sh` a été créé pour vous. Regardons ses permissions.

`ls -l mon_script.sh`{{execute}}

Il est en `-rw-r--r--`. Il n'est pas exécutable. Essayons de le lancer.

`./mon_script.sh`{{execute}}

**Permission denied !** Utilisons `chmod` pour **ajouter** (`+`) la permission d'**exécution** (`x`) pour le **propriétaire** (`u`).

`chmod u+x mon_script.sh`{{execute}}

Vérifions à nouveau. Le `x` est apparu et le script fonctionne !

`ls -l mon_script.sh`{{execute}}
`./mon_script.sh`{{execute}}

### Le Mode Symbolique Avancé : Combinaisons

La vraie puissance du mode symbolique réside dans les combinaisons.

1.  **Ciblage multiple** : Pour que vous (**u**) ET votre groupe (**g**) puissiez modifier `document.txt`, utilisez `ug`.

    `chmod ug+w document.txt`{{execute}}
    `ls -l document.txt`{{execute}}

    Les permissions sont maintenant `rw-rw-r--`.

2.  **Définition exacte et multiple** : L'opérateur `=` efface les droits existants pour définir exactement ce que vous voulez. Avec la virgule (`,`), vous pouvez enchaîner plusieurs règles.

    Sécurisons `secret.txt` en une seule commande :
    -   propriétaire (`u`) doit avoir lecture/écriture (`rw`)
    -   groupe (`g`) doit avoir lecture seule (`r`)
    -   autres (`o`) ne doivent avoir **aucun droit** (`=`)

    `chmod u=rw,g=r,o= secret.txt`{{execute}}
    `ls -l secret.txt`{{execute}}

    Résultat : `rw-r-----`. C'est une configuration de sécurité précise et claire, réalisée en une seule ligne.
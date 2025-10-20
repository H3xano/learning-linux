# Étape 2 : Le Langage des Permissions - Symbolique (`rwx`) et Octal (`755`)

Chaque groupe de permissions utilise les lettres `r` (lire), `w` (écrire), `x` (exécuter).

Pour les traduire en chiffres (notation **octale**), on utilise cette clé :
-   `r` = **4**
-   `w` = **2**
-   `x` = **1**

On **additionne** les valeurs. Par exemple, `rwx` = 4 + 2 + 1 = **7**.

### Traduisons les permissions de nos fichiers :

Pour `rapport.txt`, nous avons `-rw-r--r--`.
-   Propriétaire (`rw-`) : 4 + 2 = **6**
-   Groupe (`r--`) : 4 = **4**
-   Autres (`r--`) : 4 = **4**
Le code octal est donc **644**, un standard pour les fichiers textes.

Pour le script `script_executable.sh`, nous avons `-rwxr-x---`.
-   Propriétaire (`rwx`) : 4 + 2 + 1 = **7**
-   Groupe (`r-x`) : 4 + 1 = **5**
-   Autres (`---`) : 0 = **0**
Le code octal est **750**.
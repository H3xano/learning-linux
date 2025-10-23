Le mode octal est plus rapide pour définir **toutes** les permissions d'un coup. La clé est de mémoriser les valeurs :
-   `r` (read) = **4**
-   `w` (write) = **2**
-   `x` (execute) = **1**

On additionne ces valeurs pour chaque catégorie (Propriétaire, Groupe, Autres).

-   `rwx` = 4+2+1 = **7**
-   `rw-` = 4+2 = **6**
-   `r-x` = 4+1 = **5**
-   `r--` = 4 = **4**
-   `---` = 0

### Appliquer les standards

Pour un **script exécutable** accessible à tous, la norme est **755** (`rwxr-xr-x`). Appliquons-la à notre script.

`chmod 755 mon_script.sh`{{execute}}
`ls -l mon_script.sh`{{execute}}

Pour un **fichier de données** lisible par tous mais modifiable que par vous, la norme est **644** (`rw-r--r--`).

`chmod 644 document.txt`{{execute}}
`ls -l document.txt`{{execute}}

Pour un **fichier sensible**, la norme est **600** (`rw-------`). Personne d'autre que vous ne peut y accéder.

`chmod 600 secret.txt`{{execute}}
`ls -l secret.txt`{{execute}}
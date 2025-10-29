La sortie de `ps aux` est un flot d'informations. Son utilité principale est de trouver les processus qui posent problème, notamment ceux qui consomment trop de ressources. Pour cela, on doit trier la sortie.

### Trouver les processus gourmands en Mémoire

Pour trouver les processus qui utilisent le plus de mémoire (`%MEM`), nous pouvons utiliser l'option `--sort`.

`ps aux --sort=-%mem | head -n 5`{{execute}}

**Analyse de la commande :**
-   `ps aux` : Affiche tous les processus.
-   `--sort=-%mem` : Trie la sortie par la colonne `%MEM`. Le `-` indique un ordre décroissant (du plus grand au plus petit).
-   `| head -n 5` : Affiche seulement les 5 premières lignes du résultat trié.

---

### Trouver les processus gourmands en CPU

De la même manière, pour identifier les processus qui monopolisent le processeur (`%CPU`), il suffit de changer le critère de tri.

`ps aux --sort=-%cpu | head -n 5`{{execute}}

Sur un système peu chargé comme ce lab, les chiffres seront bas, mais la technique reste la même. C'est LA compétence clé pour diagnostiquer un serveur qui ralentit.
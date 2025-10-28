Une recherche simple, c'est bien, mais `grep` devient un super-outil avec ses options. En voici quatre qui sont absolument essentielles.

### `-i` : Ignorer la casse

Par défaut, `grep` est sensible à la casse ("paris" ≠ "Paris"). Essayons de chercher "agent" en minuscule.

`grep "agent" agents.txt`{{execute}}

Rien ! C'est parce que dans le fichier, il est écrit "Agent". Pour trouver toutes les variantes (agent, Agent, AGENT...), utilisez l'option `-i` (ignore case).

`grep -i "Agent" agents.txt`{{execute}}

### `-v` : Inverser la recherche (tout SAUF)

Et si on voulait voir tous les agents qui ne sont **PAS** de Paris ? L'option `-v` (invert) est faite pour ça.

`grep -v "Paris" agents.txt`{{execute}}

### `-n` : Afficher les numéros de ligne

Savoir **où** on a trouvé une information est crucial. L'option `-n` (line number) ajoute le numéro de la ligne au début du résultat.

`grep -n "Actif" agents.txt`{{execute}}

### `-c` : Compter les résultats

Parfois, on veut juste savoir **combien** de résultats il y a. Pour cela, on utilise `-c` (count).

`grep -c "Inactif" agents.txt`{{execute}}

---

### Bonus : Chercher plusieurs motifs (`-E`)

Et si vous vouliez trouver les agents basés à "Paris" **OU** à "New York" ? L'option `-E` active les expressions régulières étendues, où le `|` signifie "OU".

`grep -E "Paris|New York" agents.txt`{{execute}}

En une seule commande, vous avez filtré le fichier sur deux critères différents. Très puissant !
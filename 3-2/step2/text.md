# Étape 2 : Les options magiques de `grep` 🪄

Une recherche simple, c'est bien, mais `grep` devient un super-outil avec ses options. En voici quatre qui sont absolument essentielles.

### `-i` : Ignorer la casse

Par défaut, `grep` est sensible à la casse ("paris" ≠ "Paris"). Essayons de chercher "agent" en minuscule.

`grep "agent" agents.txt`{{execute}}

Rien ! C'est parce que dans le fichier, il est écrit "Agent". Pour trouver toutes les variantes (agent, Agent, AGENT...), utilisez l'option `-i` (ignore case).

`grep -i "agent" agents.txt`{{execute}}

Parfait ! Maintenant, toutes les correspondances sont trouvées.

### `-v` : Inverser la recherche (tout SAUF)

Et si on voulait voir tous les agents qui ne sont **PAS** de Paris ? L'option `-v` (invert) est faite pour ça.

`grep -v "Paris" agents.txt`{{execute}}

`grep` affiche maintenant toutes les lignes **SAUF** celles contenant "Paris". C'est extrêmement utile pour filtrer le "bruit".

### `-n` : Afficher les numéros de ligne

Savoir ce qu'on a trouvé, c'est bien. Savoir **où** on l'a trouvé, c'est mieux ! L'option `-n` (line number) ajoute le numéro de la ligne au début du résultat.

`grep -n "Actif" agents.txt`{{execute}}

Vous savez maintenant précisément à quelles lignes se trouvent les agents actifs.

### `-c` : Compter les résultats

Parfois, on ne veut pas voir les résultats, juste savoir **combien** il y en a. Pour cela, on utilise `-c` (count).

Combien d'agents ont le statut "Inactif" ?

`grep -c "Inactif" agents.txt`{{execute}}

La réponse est 2. Simple, rapide, efficace.
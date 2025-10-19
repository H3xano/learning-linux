# Étape 1 : `man` - L'encyclopédie et ses 9 sections

La commande `man` (pour **man**ual) est votre porte d'entrée vers la documentation de n'importe quelle commande.

Commençons par consulter le manuel de la commande `ls`.

`man ls`{{execute T1}}

Vous êtes maintenant dans une page `man`. C'est un lecteur de texte interactif. Pour l'instant, **appuyez simplement sur la touche `q` pour quitter**.

---

### Les 9 sections magiques

La documentation n'est pas en vrac. Elle est organisée en 9 sections. Les plus importantes pour vous sont :
-   **Section 1** : Commandes utilisateur (`ls`, `cp`...)
-   **Section 5** : Formats de fichiers de configuration (`/etc/passwd`...)
-   **Section 8** : Commandes d'administration (`useradd`, `fdisk`...)

Parfois, un même nom existe dans plusieurs sections. Par exemple, `passwd` est à la fois une commande (section 1) et un fichier de configuration (section 5).

Par défaut, `man` affiche la section avec le numéro le plus bas.

`man passwd`{{execute T1}}

Quittez avec `q`. Vous avez vu le manuel de la **commande**. Maintenant, demandons explicitement le manuel de la **section 5** pour voir le format du fichier.

`man 5 passwd`{{execute T1}}

Vous voyez maintenant la description de la structure du fichier `/etc/passwd`. C'est une compétence cruciale pour comprendre comment configurer Linux. N'oubliez pas de quitter avec `q`.
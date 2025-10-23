Un lien symbolique peut être "brisé" (broken) si sa cible disparaît. Un des pièges les plus courants est de créer un lien avec un chemin relatif, puis de le déplacer.

Un dossier `data` contenant `source.txt` a été créé pour vous.

### Créer un lien relatif fonctionnel

Plaçons-nous dans notre répertoire `home` et créons un lien relatif vers `data/source.txt`.

`cd ~`{{execute}}
`ln -s data/source.txt lien_relatif`{{execute}}

Le lien fonctionne parfaitement ici. Vérifions :

`cat lien_relatif`{{execute}}

---

### Briser le lien

Maintenant, déplaçons ce lien dans le répertoire `/tmp`.

`mv lien_relatif /tmp/`{{execute}}

Essayons de l'utiliser depuis son nouvel emplacement.

`cat /tmp/lien_relatif`{{execute}}

**"No such file or directory" !** Le lien est brisé. Pourquoi ? Parce que le chemin "data/source.txt" qu'il contient est interprété depuis `/tmp`. Il cherche `/tmp/data/source.txt`, qui n'existe pas. C'est pourquoi les **chemins absolus** sont souvent plus sûrs pour les liens.
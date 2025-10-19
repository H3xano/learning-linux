
# 🧩 Étape 5 – Inspecter les fichiers de configuration du shell

Chaque type de session lit ses propres fichiers de configuration.  
Vérifiez lesquels existent :

```bash
ls -a ~ | grep bash
````

👉 Vous verrez sans doute `.bashrc`, `.bash_profile`, `.bash_logout`.

Pour comprendre leur rôle :

* `.bash_profile` → pour les **login shells**
* `.bashrc` → pour les **sessions interactives**
* `.bash_logout` → exécuté à la déconnexion

💡 Astuce : mettez vos alias dans `.bashrc`, pas dans `.bash_profile`,
et ajoutez-y :

```bash
source ~/.bashrc
```

dans votre `.bash_profile` pour garantir la cohérence. 🧠

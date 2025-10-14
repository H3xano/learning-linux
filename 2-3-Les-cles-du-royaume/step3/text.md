# 🎭 Étape 3 — su : quand (ne pas) changer de costume

`su` ouvre une **session complète** d’un autre utilisateur (souvent root).  
Sur de nombreuses distros, root **n’a pas de mot de passe** → `su` échoue (normal).

Comparez alternatives modernes :
```bash
which su
man su | head -n 5
sudo -i
sudo -s
````

Infos utiles :

```bash
echo "sudo -i = shell root (environnement root)"
echo "sudo -s = shell root (votre environnement)"
```

💡 Choix pro : **sudo** par défaut ; **su -** seulement en maintenance spécifique.
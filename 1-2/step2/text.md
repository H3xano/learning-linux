    
# Étape 2 : Identifier sa Machine (Lien avec le cours 1.2.1)

Dans le cours, nous avons vu qu'un serveur peut être une machine physique, une Machine Virtuelle (VM), ou un conteneur. Killercoda vous fournit une **Machine Virtuelle (VM) de type serveur**.

Vérifions-le nous-mêmes ! La commande `hostnamectl` nous donne des informations détaillées sur le système. Lancez-la dans l'un de vos terminaux.

`hostnamectl`{{execute}}

Observez bien la sortie. Vous devriez voir des lignes comme celles-ci :

```bash
Virtualization: kvm
Operating System: Ubuntu 22.04.X LTS
Kernel: Linux 6.X.X
Architecture: x86-64
code Code
```
    
-   **`Virtualization: kvm`** : Ceci prouve que vous êtes bien dans une Machine Virtuelle.
-   **`Operating System: Ubuntu ...`** : Ceci vous confirme que vous travaillez sur une distribution Linux de type serveur très populaire.

Vous venez de faire le lien direct entre la théorie et la pratique en confirmant la nature de votre environnement de travail.

  
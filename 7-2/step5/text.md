Votre serveur rame mais CPU, RAM et disque sont OK ? Le coupable est souvent le réseau ! Voici les 3 vérifications de base.

### 1. `ping` - Le test de vitalité

La commande `ping` envoie un petit paquet (ICMP) à une destination pour voir si elle répond et en combien de temps (latence). C'est LA première commande à lancer.

Testons la connectivité à un serveur DNS de Google, qui est une cible très fiable.
- `-c 4` signifie : envoie 4 paquets puis arrête-toi.

`ping -c 4 8.8.8.8`{{execute}}

Regardez la ligne `time=... ms`. C'est votre latence. En dessous de 50ms, c'est généralement bon. Si vous avez `0% packet loss` (0% de perte de paquets), c'est parfait.

### 2. `dig` - Le traducteur de noms

Parfois, `ping 8.8.8.8` fonctionne mais `ping google.com` échoue. Le problème ? Le DNS, le service qui traduit les noms de domaine en adresses IP. La commande `dig` permet de le tester.

`dig google.com +short`{{execute}}

Cette commande doit vous retourner une adresse IP. Si elle ne retourne rien, votre DNS est défaillant !

### 3. `ss` - Le radar des ports

Votre service web est-il bien en train d'écouter les connexions entrantes ? `ss` (Socket Statistics), le remplaçant moderne de `netstat`, vous le dira.

- `-t` pour TCP, `-u` pour UDP, `-l` pour "listening" (en écoute), `-n` pour afficher les numéros de port.

`ss -tuln`{{execute}}

Cette commande liste tous les ports sur lesquels votre machine attend des connexions. Vous devriez voir le port `22` (pour SSH). Si vous aviez un serveur web, vous chercheriez les ports `80` (HTTP) ou `443` (HTTPS).
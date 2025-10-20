# Étape 5 : Scénario Réel - Réparer un Projet

Vous venez de recevoir une archive `projet_casse.tar.gz`. Après l'avoir extraite, vous constatez un problème.

`tar -xzf projet_casse.tar.gz`{{execute}}

Maintenant, listons le contenu de votre répertoire `home` pour voir le nouveau dossier.

`ls -l`{{execute}}

Regardez la ligne pour `projet_casse`. Les colonnes propriétaire et groupe sont des numéros (`1234`, `5678`) ! Ce sont des **fichiers orphelins**. L'utilisateur et le groupe qui les possédaient n'existent pas sur ce système.

Votre mission est de vous réapproprier ce projet.

---
### Réparer la propriété

Utilisez `chown -R` pour vous assigner (vous êtes `learner`) l'entièreté du dossier `projet_casse` ainsi que le groupe `webteam` que nous avons créé.

`sudo chown -R learner:webteam projet_casse`{{execute}}

Vérifions une dernière fois.

`ls -l projet_casse`{{execute}}

Parfait ! Les fichiers orphelins ont disparu et le projet vous appartient maintenant, partagé avec votre équipe `webteam`. Vous avez résolu un problème d'administration système courant.
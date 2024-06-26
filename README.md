# `PANORAMA DU CLOUD AWS`

# 👨🏼‍🤝‍👨🏼 Participants:
  - MANFO JIENGAP Rosvalde Florient
  - FOUMBI DJOMO Ranyl Josué

## 🏗️ Structure du Projet:
Le projet est structuré en plusieurs dossiers principaux, chacun ayant un rôle spécifique dans l'architecture et le déploiement de notre solution.

### Dossier `aws`
Ce dossier est essentiel pour la gestion des ressources AWS utilisées par le projet. Il contient deux sous-dossiers principaux :

#### `ansible`
Ce sous-dossier contient les scripts et les configurations nécessaires pour le déploiement de notre application. Ansible est utilisé pour automatiser le déploiement et la configuration des services sur les instances EC2.

#### `terraform`
Ce sous-dossier est utilisé pour la création et la gestion des instances EC2 sur AWS. Terraform permet de définir l'infrastructure comme code, ce qui facilite la création, la modification et la suppression des ressources AWS de manière reproductible et automatisée.

 Le Sous-répertoire `app` du dossier `ansible` constitu le projet à déployer

#### SWARM 
En raison d'insufisance matériel nous n'avons pas pu effectuer les test du déploiement avec `swarm` sur plus de `2 instances simultanément`. Par ailleur si vous désirez le voir fonctionner sur toutes les instances nous vous invitons à décommenter les lignes commentées du fichier `aws/ansible/app/swarm.sh` puis lancer le script `swarm.sh`


## Etapes d'execution
- Situer dans la region ` us-east-1` sur aws 
- Créer un fichier myKey.pem et le placer à la racine du repertoire ansible 
- Ajouter les valeurs du `access_key` et du `secret_key` de compote aws dans les `fichiers aws/ansible/aws_ec2.yml`
- Sauvegardez le `access_key` et le `secret_key` dans un fichier text , car ils vous seront également demandé lors de la crétion des instances
- Lancer le script `start.sh`situé à racine, afin de créer les instance et par la suite déployer l'aplication sur les instances crées
    
     - Il se pourrait que le `script start.sh`  ne fonctionne pas. Dans cas nous vous recommandons de: 
     -  De lancer le script `launch.sh` ou encore d'ouvrir le fichier `aws/launch.sh` et d'exécuter manuellement chaque commande. Ce script créera les instances sur EC2
     - Une fois les instances créees re-exécutez le script `start.sh` afin de configurer les instances et déployer le projet
- Pour `détruire les instances` positionnez vous dans le repertoire `/aws` et exécutez le script `destroy.sh`
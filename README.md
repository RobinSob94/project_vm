# Projet VM avec Terraform : 

Ce projet vise à automatiser le déploiement d'une machine virtuelle (VM) sur Amazon Web Services (AWS) à l'aide de Terraform. La VM sera configurée pour exécuter une application spécifique à l'aide de Docker et Git, en ouvrant les ports nécessaires pour accéder à l'application depuis l'extérieur de la VM. Projet Etudiant

## Contenu du projet

- `variables.tf`: Ce fichier contient les variables utilisées dans le projet. Assurez-vous de remplacer les valeurs par défaut des clés d'accès AWS (`aws_access_key` et `aws_secret_key`) par vos propres informations d'identification AWS.
  
- `main.tf`: Ce fichier contient la configuration Terraform pour créer la VM sur AWS. Il spécifie l'AMI, le type d'instance, les règles de sécurité, etc.

- `script.sh`: Ce script contient les commandes à exécuter à distance sur la VM après sa création. Il installe Docker, Git et lance l'application.

## Utilisation

1. Assurez-vous d'avoir Terraform installé sur votre machine.
2. Configurez vos informations d'identification AWS dans le fichier `variables.tf`.
3. Exécutez `terraform init` pour initialiser le répertoire de travail.
4. Exécutez `terraform plan` pour vérifier les changements proposés.
5. Exécutez `terraform apply` pour appliquer les changements et créer la VM.
6. Une fois la VM créée, vous pouvez accéder à l'application en utilisant l'adresse IP publique de la VM.

Assurez-vous de ne pas oublier de supprimer la VM une fois que vous avez terminé son utilisation en exécutant `terraform destroy`.

## Avertissement

Veillez à ne pas publier vos informations d'identification AWS ni toute autre information sensible dans votre dépôt Git. Assurez-vous également de ne pas oublier de configurer les règles de sécurité appropriées pour votre environnement.

## Contributeurs

Robin SOBASTO (GitHub: RobinSob94)
Nourdine YOUSSOUF (GitHub: nono231000)

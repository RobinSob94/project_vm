#!/bin/bash

# Mise à jour du système
sudo yum update -y

# Installation de Git
sudo yum install -y git

# Installation de Docker
sudo yum install -y docker

# Démarrage du service Docker
sudo systemctl start docker

# Activation du démarrage automatique de Docker au démarrage du système
sudo systemctl enable docker

# Installation de Node.js et npm à partir du dépôt EPEL (Extra Packages for Enterprise Linux)
sudo yum install -y epel-release
sudo yum install -y nodejs npm

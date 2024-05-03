#!/bin/bash
figlet on
# Installation docker
curl https://download.docker.com/linux/ubuntu/dists/$(lsb_release --codename | cut -f2)/pool/stable/$(dpkg --print-architecture)/docker-ce_<DOCKER_VERSION>~3-0~ubuntu-focal_amd64.deb -o docker-ce.deb
curl https://download.docker.com/linux/ubuntu/dists/$(lsb_release --codename | cut -f2)/pool/stable/$(dpkg --print-architecture)/docker-ce-cli_<DOCKER_VERSION>~3-0~ubuntu-focal_amd64.deb -o docker-ce-cli.deb
curl https://download.docker.com/linux/ubuntu/dists/$(lsb_release --codename | cut -f2)/pool/stable/$(dpkg --print-architecture)/containerd.io_<CONTAINERD_VERISON>-1_amd64.deb -o containerd.deb
sudo apt-get install ./docker-ce.deb ./docker-ce-cli.deb ./containerd.deb
# Mise à jour des packages (encore une fois après l'ajout du référentiel Docker)
sudo apt update
# Installation de Git
sudo apt install -y git
# Vérification de l'installation de Docker
sudo docker --version
# Vérification de l'installation de Git
git --version
# Installation de Node.js et npm à partir du dépôt EPEL (Extra Packages for Enterprise Linux)
sudo apt install -y epel-release
sudo apt install -y nodejs npm
#clone du repo et rentrer dans le dossier
git clone https://github.com/RobinSob94/tailwind_temp
cd tailwind_temp
#install et démarage du projet
npm install
npm run dev
figlet SCRIPT END
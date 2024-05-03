variable "aws_access_key" {
  description = "Clé d'accès AWS pour l'authentification"
  default     = "AKIA2UC3F2PUCYA2TK2K"
}

variable "aws_secret_key" {
  description = "Clé secrète AWS pour l'authentification"
  default     = "f+oInvlDPutFzK94x/Ck72xZCJCYmBQZQJf4lv2p"
}

variable "aws_region" {
  description = "Région AWS dans laquelle déployer les ressources"
  default     = "eu-north-1"
}

variable "instance_name" {
  description = "Nom de l'instance EC2"
  default     = "my-projet"
}

variable "ssh_username" {
  description = "Nom d'utilisateur pour la connexion SSH à l'instance EC2"
  default     = "ubuntu"
}

variable "script_path" {
  description = "Chemin local vers le script à exécuter sur l'instance EC2"
  default     = "./script.sh"
}

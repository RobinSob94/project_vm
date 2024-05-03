provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "tls_private_key" "mytf_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "newtfkey" {
  key_name   = "mytfkey"
  public_key = tls_private_key.mytf_key.public_key_openssh
}

resource "aws_instance" "terraform-vm" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.websg.id]
  key_name               = aws_key_pair.newtfkey.key_name

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "websg" {
  name = "projet-sg"
  ingress {
    description = "TCP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_ips" {
  value = aws_instance.terraform-vm.public_ip
}

resource "null_resource" "name" {
  connection {
    type        = "ssh"
    port        = 22
    user        = var.ssh_username
    private_key = tls_private_key.mytf_key.private_key_pem
    host        = aws_instance.terraform-vm.public_ip
  }

  provisioner "file" {
    source      =  "./script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get install -y figlet",
      "figlet SCRIPT START",
      "mv /tmp/script.sh ./script.sh",
      "chmod +x ./script.sh",
      "bash script.sh"
    ]
  }

  depends_on = [aws_instance.terraform-vm]
}

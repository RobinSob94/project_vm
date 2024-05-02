provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}
resource "aws_instance" "example" {
  ami           = "ami-03c3351e3ce9d04eb"
  instance_type = "t3.micro"
}
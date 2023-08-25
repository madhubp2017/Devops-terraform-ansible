terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-west-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-026257f4f39c28af8"
  instance_type = "t2.micro"
  key_name = "madhu-import"

  tags = {
    Name = "Madhu-DevOps-batch-server"
    env = "Production"
    owner = "Madhu"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}


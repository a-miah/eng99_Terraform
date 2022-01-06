# Let terraform know who is our provider 

# AWS plugins/dependencies will be downloaded
provider "aws" {
  region = "eu-west-1"
  # This will allow terraform to create services on eu-west-1
}

# Let's start with launching EC2 instance using terraform script

resource "aws_instance" "app_instance" {
  ami = var.app_ami_id # ami id for 18.04LTS ubuntu
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-0b9e489cde569ec16"]
  tags = {
    Name = "eng99_attaik_terraform_app"
  }
  key_name = "eng99" # ensure that we have this key in .ssh folder
}

# To initialise we use terraform init
# terraform plan - checks file for errors
# terraform apply - launches ec2 on aws
# terraform destroy - kills ec2 

# Creating a VPC


resource "aws_vpc" "vpc_terraform" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"    
    
    tags = {
        Name = "eng99_attaik_terraform_vpc"
    }
}

# Create security groups

resource "aws_security_group" "public_security_group" {
  name = "eng99_attaik_terraform_app"
  description = "app security group"
  vpc_id = var.vpc_id  # link SG with VPC


  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { # allow ssh into instance
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# outbound rules
  egress { 
    from_port = 0 
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eng99_attaik_terraform_public_sg"
  }
}
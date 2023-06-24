terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configures the AWS provider
provider "aws" {
  region                   = "eu-central-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"
}

# Create security group for web server
resource "aws_security_group" "web_server_sg" {
  name        = "web-server-sg-tf"
  description = "Security group for the web server"

  # SSH port
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP traffic
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create security group for database
resource "aws_security_group" "db_server_sg" {
  name        = "db-server-sg-tf"
  description = "Security group for the database"

  # MySQL port
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SSH port
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create EC2 instance for the web server
resource "aws_instance" "web_server" {
  ami           = "ami-097c5239e879ff531"
  instance_type = "t2.micro"
  key_name      = "aleksandar-stojkovic-web-server-key-2" 

  tags = {
    Name = "task-12-web-server-tf"
    CreatedBy = "aleksandar.stojkovic"
    Project = "task-12"
    IaC = "Terraform"
  }

  vpc_security_group_ids = [
    aws_security_group.web_server_sg.id,
  ]
}

# Create EC2 instance for the database
resource "aws_instance" "db_server" {
  ami           = "ami-0e36672228a8d4984"
  instance_type = "t2.micro"
  key_name      = "aleksandar-stojkovic-web-server-key-2"

  tags = {
    Name = "task-12-db-server-tf"
    CreatedBy = "aleksandar.stojkovic"
    Project = "task-12"
    IaC = "Terraform"
  }

  vpc_security_group_ids = [
    aws_security_group.db_server_sg.id,
  ]
}

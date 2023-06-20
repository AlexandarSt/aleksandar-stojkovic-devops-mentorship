packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "amazon_linux_web" {
  profile       = "default"
  ami_name      = "task-12-web-server-{{timestamp}}"
  instance_type = "t2.micro"
  region        = "eu-central-1"
  source_ami    = "ami-0b2ac948e23c57071"
  ssh_username  = "ec2-user"
}

source "amazon-ebs" "amazon_linux_mysql" {
  profile       = "default"
  ami_name      = "task-12-db-server-{{timestamp}}"
  instance_type = "t2.micro"
  region        = "eu-central-1"
  source_ami    = "ami-0b2ac948e23c57071"
  ssh_username  = "ec2-user"
}

build {
  name = "learn-packer"
  sources = [
    "source.amazon-ebs.amazon_linux_web",
    "source.amazon-ebs.amazon_linux_mysql"
  ]

  provisioner "shell" {
    # This provisioner only runs for the 'amazon_linux_web' source.
    only = ["amazon-ebs.amazon_linux_web"]

    inline = [
      "sleep 30",
      "sudo yum update -y"
    ]
  }

  provisioner "shell" {
    # This provisioner only runs for the 'amazon_linux_mysql' source.
    only = ["amazon-ebs.amazon_linux_mysql"]

    inline = [
      "sleep 30",
      "sudo yum update -y"
    ]
  }
}

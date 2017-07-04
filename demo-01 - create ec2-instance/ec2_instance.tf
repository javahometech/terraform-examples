# Terraform code to create ec2 instance

provider "aws"{
  access_key = "your-access-key"
  secret_key = "your-secret-key"
  region = "us-west-2"
}

resource "aws_instance" "myec2"{
  ami = "ami-6df1e514"
  instance_type = "t2.micro"

  tags{
    Name = "LinuxServerByTerraform"
  } 
}

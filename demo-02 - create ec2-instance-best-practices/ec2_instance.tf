# Terraform code to create ec2 instance

resource "aws_instance" "myec2"{
  ami = "ami-6df1e514"
  instance_type = "t2.micro"

  tags{
    Name = "LinuxServerByTerraform"
  } 
}

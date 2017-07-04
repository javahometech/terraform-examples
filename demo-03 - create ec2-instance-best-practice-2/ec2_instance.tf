# Terraform code to create ec2 instance

resource "aws_instance" "myec2"{
  ami = "${lookup(var.AMIS,"${var.REGION}")}"
  instance_type = "t2.micro"

  tags{
    Name = "LinuxServerByTerraform"
  } 
}

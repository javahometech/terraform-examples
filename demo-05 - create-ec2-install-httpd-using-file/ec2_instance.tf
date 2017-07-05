# Terraform code to create ec2 instance and install httpd

resource "aws_instance" "myec2"{
  ami = "${lookup(var.AMIS,"${var.REGION}")}"
  instance_type = "t2.micro"
  
  user_data = "${file("user_data.sh")}"
  
  tags{
    Name = "LinuxServer-Httpd"
  } 
}

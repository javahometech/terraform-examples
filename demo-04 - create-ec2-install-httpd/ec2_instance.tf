# Terraform code to create ec2 instance and install httpd

resource "aws_instance" "myec2"{
  ami = "${lookup(var.AMIS,"${var.REGION}")}"
  instance_type = "t2.micro"
  
  user_data =  <<EOF
   #! /bin/bash
   yum install httpd -y
   service httpd start
   echo "<h1>Welcome to terraform</h1>" > /var/www/html/index.html
   chkconfig httpd on
  EOF
  tags{
    Name = "LinuxServer-Httpd"
  } 
}

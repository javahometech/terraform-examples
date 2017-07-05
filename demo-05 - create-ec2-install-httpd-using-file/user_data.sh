   #! /bin/bash
   yum install httpd -y
   service httpd start
   echo "<h1>Welcome to terraform</h1>" > /var/www/html/index.html
   chkconfig httpd on
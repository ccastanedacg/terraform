#!/bin/bash -v
#-------asg/userdata.sh.tpl
yum install -y httpd

sed -i 's/80/8080/' /etc/httpd/conf/httpd.conf
service httpd start 
chkonfig httpd on

echo "<html><h1>Esta vivo!! ^^</h2></html>" > /var/www/html/index.html
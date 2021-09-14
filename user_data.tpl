#!/bin/bash
yum -y update
yum -y install httpd

myIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h1>Response from ${instance_name} ($myIP)</hi>" > /var/www/html/index.html

systemctl start httpd
chkconfig httpd on
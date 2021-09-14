#!/bin/bash
yum -y update
yum -y install httpd

myIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
cat <<EOF > /var/www/html/index.html
<h1>Response from ${instance_name} ($myIP)</hi>"
<h3>Author: ${author}</h3>
EOF

systemctl start httpd
chkconfig httpd on
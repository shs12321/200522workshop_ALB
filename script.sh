#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install httpd
sudo su -
yum update -y
yum install httpd -y

echo "<html> Hello <img src=http://d111111abcdef8.cloudfront.net/
images/image.jpg> </html>
" > index.html

# start httpd
systemctl start httpd.service
#systemctl status httpd.service

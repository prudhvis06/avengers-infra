#!/bin/bash
yum update -y
yum install -y git unzip httpd
systemctl start httpd
systemctl enable httpd
echo "Welcome Avengers!" > /etc/motd

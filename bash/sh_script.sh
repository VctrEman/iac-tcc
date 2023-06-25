#! /bin/bash
#!/bin/bash

yum update -y
yum search docker
yum info docker
yum -y install docker
usermod -a -G docker ec2-user
id ec2-user
newgrp docker
wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) 
mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
chmod -v +x /usr/local/bin/docker-compose
systemctl enable docker.service
systemctl start docker.service
export HOME=/home/ec2-user
yum install git -y
mkdir ~/downloads
cd ~/downloads



#sudo yum update -y
#sudo yum install -y docker
#sudo service docker start
#sudo usermod -aG docker $USER
#sudo yum install -y docker-compose-plugin
#docker compose version



#https://askubuntu.com/questions/477551/how-can-i-use-docker-without-sudo use docker without sudo
#meu problema no sudo update era a VPC sem internet
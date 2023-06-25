#!/bin/bash

yum update -y 
sudo amazon-linux-extras install docker 
yum install docker 
service docker start 
usermod -a -G docker ec2-user 
id ec2-user
systemctl enable docker.service
systemctl start docker.service
newgrp docker
wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) 
mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
chmod -v +x /usr/local/bin/docker-compose
export HOME=/home/ec2-user
gpasswd -a ec2-user docker #inclusao do root no grupo docker, docker ps sem sudo
yum install git -y
#git config --global credential.provider generic
mkdir ~/downloads
cd ~/downloads
echo "final part here.."
git clone -v https://github.com/VctrEman/DadosAbertos.git
echo "finished git clone"

#sudo cat /var/log/cloud-init-output.log #output log
#sudo ssh -i ~/.ssh/"terraform-aws" -L 3000:localhost:3000 -N -f ec2-user@ec2-44-208-165-97.compute-1.amazonaws.com
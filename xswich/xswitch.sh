#!/bin/bash
sudo apt-get update
sudo apt-get install -y make zip wget || sudo yum install -y make zip wget
sudo wget https://xswitch.cn/download/xswitch-install.tar.gz --user xswitch --password password
tar zxvf xswitch-install.tar.gz && cd xswitch-install
make setup && mv .env .env.beifen
cp ../.env .env
ip=$(curl ip.sb)
echo "公网IP，"; 

read y_name
make up



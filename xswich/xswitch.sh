#!/bin/bash
sudo apt-get update && sudo apt-get install -y make zip wget
wget https://xswitch.cn/download/xswitch-install.tar.gz --user xswitch --password password
tar zxvf xswitch-install.tar.gz && cd xswitch-install
make setup
vim .env


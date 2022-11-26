#!/bin/bash
export PATH=$PATH:~/bin
source ~/.bashrc
set -Eeuxo pipefail
git clone https://github.com/ugoviti/izpbx.git /izpbx && cd /izpbx
echo "进程:" pstree -aup
echo "内网:" ip addr | grep inet
echo "外网:" curl ip.sb
cp default.env .env && vim .env 

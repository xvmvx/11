#!/bin/bash
export PATH=$PATH:~/bin
source ~/.bashrc
set -Eeuxo pipefail
git clone https://github.com/ugoviti/izpbx.git && cd /izpbx
ring = pstree -aup
echo -n "进程:"; echo pstree -aup
echo -n "内网:"; echo ip addr | grep inet
echo -n "外网:"; echo  curl ip.sb
cp default.env .env && vim .env 

#!/bin/bash
echo "#######################################################################"
echo "              Docker  Docker-compose    other         "
echo "======================================================================"
echo "1.海外服务器Docker 2.大陆服务器Docker 3.卸载docker "
echo "4.CentOS 同步时间 5.CentOS 关闭防火墙 6.NPM 7.宝塔面板"
echo "#######################################################################"
echo "  "
read -p "返回上层请按 0  ，退出请回车" menuNumberInput
  case "$menuNumberInput" in
    1 )
        apt-get update && apt-get install -y wget vim
        wget -qO- get.docker.com | bash
        sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose
        docker-compose --version
    ;;
    2 )
        curl -sSL https://get.daocloud.io/docker | sh
        curl -L https://get.daocloud.io/docker/compose/releases/download/v2.1.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose
    ;;
    3 )
        sudo apt-get purge docker-ce docker-ce-cli containerd.io
        sudo rm -rf /var/lib/docker
        sudo rm -rf /var/lib/containerd
    ;;
    4 )
        yum -y install ntpdate
        timedatectl set-timezone Asia/Shanghai
        ntpdate ntp1.aliyun.com
	;;
    5 )
    	systemctl start supervisord
    	systemctl disable firewalld
    	systemctl stop firewalld
    ;;
    6 )
    	cd npm && docker-compose up -d
    ;;
    7 )
        source ./bt.sh
    ;;
    0 )
    	source ./1.sh
    ;;
    * )
      clear
      esac
    ;;
    esac
}

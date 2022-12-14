#!/bin/bash
echo "#######################################################"
echo "             Docker  Docker-compose    other         "
echo "======================================================="
echo "-----  1.Docker安装 Docker docker-compose "
echo "-----  2.WARP 3.BBR 4.呆梨 -XUI -make"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "######################################################"
read -p "按照提示输入正确的数字  返回上层请按 0  ，退出请回车>>>>>>>>>" menuNumberInput
  case "$menuNumberInput" in
    1 )
    	echo -n "官方docker请按1，官方docker-compose请按2，一键脚本请按3，返回上层按4，退出按5  >>>>>>>> "
	read character
	if [ "$character" = "1" ]; then
		sudo apt-get remove docker docker-engine docker.io containerd runc || sudo yum install apt-get
		sudo apt-get update && sudo apt-get install ca-certificates curl gnupg lsb-release
		sudo mkdir -p /etc/apt/keyrings
		sudo curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
		sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
		$(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
		sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
	elif [ "$character" = "2" ]; then
		curl -L https://get.daocloud.io/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
		chmod +x /usr/local/bin/docker-compose
		ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
	elif [ "$character" = "3" ]; then
            	source ./d.sh
	elif [ "$character" = "4" ]; then
            	source ./1.sh
	else
      		clear
      		esac
	fi
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

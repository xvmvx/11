#!/bin/bash
clear
echo "#######################################################"
echo "             应用安装         "
echo "======================================================="
echo "-----  1.Nginx PM "
echo "-----  2.BT"
echo "-----  3.Xswitch"
echo "-----   . "
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "######################################################"
read -p "按照提示输入正确的数字  返回上层请按 0  ，退出请回车>>>>>>>>>" menuNumberInput
  case "$menuNumberInput" in
    1 )
    	clear
      cd /root/1/npm
	    echo "#######################################################"
    	echo -n " 需要在docker-compose环境中运行，请确定已经正确安装"
      docker-compose up -d
      echo -n " http：//yourIP:81 登录，用户名：admin@excaple.com 密码：changeme"
      echo -n " 占用  80  81  443 端口"
      cd ..
    ;;
    2 )
        clear
        source ~/1/bt.sh
    ;;
    3 )
        clear
        echo "#######################################################"
    	  echo -n " 需要在docker-compose环境中运行，请确定已经正确安装"
        cd ~/1/xswitch
        chmod +x *
        ./xswitch.sh
	  ;;
    0 )
    	source ./1.sh
    ;;
    * )
      clear
      esac


#!/bin/bash
echo "#######################################################################"
echo "              DD      WARP      BBR          "
echo "======================================================================"
echo "1.推荐 MoeClub脚本 2.安装组件 3.刷新Mirrors缓存或更换镜像源 "
echo "4.DD脚本 5.WARP 6.CentOS7 BBR 7.一键开启BBR 8.呆梨-XUI 9.呆梨-make"
echo "#######################################################################"
echo "  "
read -p "返回上层请按 0  ，退出请回车" menuNumberInput
  case "$menuNumberInput" in
    1 )
      	wget -N --no-check-certificate https://down.vpsaff.net/linux/dd/network-reinstall-os.sh && \
	chmod +x network-reinstall-os.sh && ./network-reinstall-os.sh
    ;;
    2 )
    	apt-get install -y xz-utils openssl gawk file wget screen && screen -S os || yum install -y xz openssl gawk file glibc-common wget screen && screen -S os
        echo "组件安装成功，将为你刷新Mirrors缓存和更换镜像源 "
	yum makecache && yum update -y || apt update -y && apt dist-upgrade -y
	
	echo -n "国内主机继续安装25合一DD经典版本请按31，新32，国际主机请按41，新42> "
	read character
	if [ "$character" = "31" ]; then
     		wget --no-check-certificate -O AutoReinstall.sh https://cdn.jsdelivr.net/gh/fcurrk/reinstall@master/AutoReinstall.sh && chmod a+x AutoReinstall.sh && bash AutoReinstall.sh
	elif [ "$character" = "32" ]; then
     		wget --no-check-certificate -O NewReinstall.sh https://cdn.jsdelivr.net/gh/fcurrk/reinstall@master/NewReinstall.sh && chmod a+x NewReinstall.sh && bash NewReinstall.sh
	elif [ "$character" = "41" ]; then
     		wget --no-check-certificate -O AutoReinstall.sh https://git.io/betags && chmod a+x AutoReinstall.sh && bash AutoReinstall.sh
	elif [ "$character" = "42" ]; then
     		wget --no-check-certificate -O NewReinstall.sh https://git.io/newbetags && chmod a+x NewReinstall.sh && bash NewReinstall.sh
	else
    		echo 输入不符合要求
	fi
    ;;
    3 )
    	echo -n "安装25合一DD经典版本请按1，最新版本请按2> "
	read character
	if [ "$character" = "1" ]; then
     		wget --no-check-certificate -O AutoReinstall.sh https://cdn.jsdelivr.net/gh/fcurrk/reinstall@master/AutoReinstall.sh && chmod a+x AutoReinstall.sh && bash AutoReinstall.sh
	elif [ "$character" = "2" ]; then
     		wget --no-check-certificate -O NewReinstall.sh https://cdn.jsdelivr.net/gh/fcurrk/reinstall@master/NewReinstall.sh && chmod a+x NewReinstall.sh && bash NewReinstall.sh
	else
    		echo 输入不符合要求
	fi    
    ;;
    4 )
	echo -n "安装25合一DD经典版本请按1，最新版本请按2> "
	read character
	if [ "$character" = "1" ]; then
     		wget --no-check-certificate -O AutoReinstall.sh https://git.io/betags && chmod a+x AutoReinstall.sh && bash AutoReinstall.sh
	elif [ "$character" = "2" ]; then
     		wget --no-check-certificate -O NewReinstall.sh https://git.io/newbetags && chmod a+x NewReinstall.sh && bash NewReinstall.sh
	else
    		echo 输入不符合要求
	fi    
    ;;
    5 )
    	wget -N --no-check-certificate https://cdn.jsdelivr.net/gh/YG-tsj/CFWarp-Pro/multi.sh && chmod +x multi.sh && ./multi.sh
    ;;
    6 )
    	wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
    ;;
    7 )
        uname -srm
    ;;
    8 )
        bash <(curl -Ls https://raw.githubusercontent.com/sprov065/x-ui/master/install.sh) 0.2.0
    ;;
    9 )
        wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" && chmod 700 /root/install.sh && /root/install.sh
    ;;
    0 )
    	source ./1.sh
    ;;
    * )
      clear
      esac

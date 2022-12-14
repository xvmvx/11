#!/bin/bash
echo "#######################################################"
echo "              DD      WARP      BBR          "
echo "======================================================="
echo "1.DD安装 DD组件 国内DD 国外DD "
echo "2.WARP 3.BBR 7.一键开启BBR 8.呆梨-XUI 9.呆梨-make"
echo "######################################################"
read -p "返回上层请按 0  ，退出请回车" menuNumberInput
  case "$menuNumberInput" in
    1 )
    	echo -n "安装组件请按1，返回上层按2，退出按3  >>>>>>>> "
	read character
	if [ "$character" = "1" ]; then
        	apt-get install -y xz-utils openssl gawk file wget screen && screen -S os || yum install -y xz openssl gawk file glibc-common wget screen && screen -S os
        	if [ "$?" = "0" ]; then
            		echo "组件安装成功，将为你刷新Mirrors缓存和更换镜像源 "
        	else
            		echo "组件安装失败，请检查！" 1>&2
  	    		exit 1
		fi
		yum makecache && yum update -y || apt update -y && apt dist-upgrade -y
		if [ "$?" = "0" ]; then
            		echo "已更换镜像源 "
        	else
            		echo "更换镜像源失败，请检查！" 1>&2
  	    	exit 1
		fi
	fi
	echo -n "安装综合DD 按1，国内DD 按2,国外DD 按3，返回上层按4，退出按5  >>>>>>>> "
	read character2
	if [ "$character2" = "1" ]; then
		wget -N --no-check-certificate https://down.vpsaff.net/linux/dd/network-reinstall-os.sh && \
             	chmod +x network-reinstall-os.sh && ./network-reinstall-os.sh
	elif [ "$character2" = "2" ]; then
    	    	echo -n "国内主机继续安装25合一DD经典版本请按1，新2，返回上层按3，退出按4   >>>>>>>>> "
		read character3
		if [ "$character3" = "1" ]; then
     			wget --no-check-certificate -O AutoReinstall.sh https://cdn.jsdelivr.net/gh/fcurrk/reinstall@master/AutoReinstall.sh && chmod a+x AutoReinstall.sh && bash AutoReinstall.sh
		elif [ "$character3" = "2" ]; then
     			wget --no-check-certificate -O NewReinstall.sh https://cdn.jsdelivr.net/gh/fcurrk/reinstall@master/NewReinstall.sh && chmod a+x NewReinstall.sh && bash NewReinstall.sh
		elif [ "$character3" = "3" ]; then
		    	source ./17.sh
		elif [ "$character3" = "4" ]; then
    	    		esac
		else
    	    		echo 输入不符合要求
        	fi
	elif [ "$character2" = "3" ]; then
		echo -n "国外主机继续安装25合一DD经典版本请按1，新2，返回上层按3，退出按4  >>>>>>>>> "
		read character4
		if [ "$character4" = "1" ]; then
     			wget --no-check-certificate -O AutoReinstall.sh https://git.io/betags && chmod a+x AutoReinstall.sh && bash AutoReinstall.sh
		elif [ "$character4" = "2" ]; then
     			wget --no-check-certificate -O NewReinstall.sh https://git.io/newbetags && chmod a+x NewReinstall.sh && bash NewReinstall.sh
		elif [ "$character4" = "3" ]; then
		    	source ./17.sh
		elif [ "$character4" = "4" ]; then
    	    		esac
		else
    	    		echo 输入不符合要求
        	fi
	elif [ "$character2" = "4" ]; then
	    source ./1.sh
	elif [ "$character2" = "5" ]; then
    	    esac
	else
    	    echo 输入不符合要求
        fi
    ;;
    2 )
    	wget -N --no-check-certificate https://cdn.jsdelivr.net/gh/YG-tsj/CFWarp-Pro/multi.sh && chmod +x multi.sh && ./multi.sh
    ;;
    3 )
    	echo -n "Centos7 BBR 按1，一键开启BBR 按2，返回上层按3，退出按4  >>>>>>>>> "
	read character5
	if [ "$character5" = "1" ]; then
     		wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
	elif [ "$character5" = "2" ]; then
     		uname -srm
	elif [ "$character5" = "3" ]; then
		source ./1.sh
	elif [ "$character5" = "4" ]; then
    	    	esac
	else
    	    	echo 输入不符合要求
        fi
    	
    ;;
    4 )
        echo -n "呆梨的相关  XIU按1，make按2，返回上层按3，退出按4  >>>>>>>>> "
	read character6
	if [ "$character6" = "1" ]; then
     		bash <(curl -Ls https://raw.githubusercontent.com/sprov065/x-ui/master/install.sh) 0.2.0
	elif [ "$character6" = "2" ]; then
     		wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" && chmod 700 /root/install.sh && /root/install.sh
    	elif [ "$character6" = "3" ]; then
		source ./1.sh
	elif [ "$character6" = "4" ]; then
    	    	esac
	else
    	    	echo 输入不符合要求
        fi
    ;;
    5 )
        source ./1.sh
    ;;
    * )
      clear
      esac

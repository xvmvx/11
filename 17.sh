#!/bin/bash
echo "#######################################################################"
echo "              DD      WARP      BBR          "
echo "======================================================================"
echo "1.推荐 MoeClub脚本 2.甲骨文 DD成Debian 10 3.甲骨文 DD成Ubuntu 20.04 "
echo "4.DD脚本 5.WARP 6.CentOS7 BBR 7.一键开启BBR 8.呆梨-XUI 9.呆梨-make"
echo "#######################################################################"
echo "  "
read -p "返回上层请按 0  ，退出请回车" menuNumberInput
  case "$menuNumberInput" in
    1 )
      	bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh') -d 10 -v 64 -p "自定义root密码" -port "自定义ssh端口"
    ;;
    2 )
      	bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh') -d 10 -v 64 -p "自定义root密码" -port "自定义ssh端口"
    ;;
    3 )
    	bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh') -u 20.04 -v 64 -p "自定义root密码" -port "自定义ssh端口"
    ;;
    4 )
        wget --no-check-certificate -O AutoReinstall.sh https://git.io/AutoReinstall.sh && bash AutoReinstall.sh
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

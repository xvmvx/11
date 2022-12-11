#!/bin/bash
echo "#######################################################################"
xitong=$(cat /etc/issue)
CentOS="CentOS"
echo -n "本机系统是：" ; echo ${xitong%(Final)*}
result=$(echo $xitong | grep "${CentOS}")
if [[ "$result" != "" ]]
then
    echo "本机IP请使用ifconfig -a 检测"
else
    echo -n "本机IP是："; curl ip.sb
fi
alias find="find . -name"

echo "本机已启用的命令别名"
alias
echo "alias显示全部别名，unalias lt删除别名"
echo "======================================================================"
echo "本机服务商信息请vim修改/etc/profile文件的末尾添加"
echo "本机已启用：VOS3000"
echo "#######################################################################"
echo "1.   运行   综合工具箱"
echo "2.   运行   杜甫测试"
echo "3.   DD 推荐     MoeClub脚本"
echo "31.  甲骨文   DD成Debian 10"
echo "32.  甲骨文   DD成Ubuntu 20.04"
echo "33.  DD脚本"
echo "       测试      "
echo "41.   单线程测试"
echo "42.   最全测速脚本"
echo "43.   superbench"
echo "44.   Bench.sh"
echo "       速度测试      "
echo "45.   显示延迟、抖动"
echo "46.   直接显示回程线路"
echo "47.   四网测速"
echo "48.   三网测速"
echo "       媒体测试      "
echo "49.   流媒体测试"
echo "5.    WARP"
echo "51.   CentOS 同步时间"
echo "       BBR        "
echo "61.   CentOS 7 BBR   "
echo "62.   一键开启BBR"
echo "      Docker相关     "
echo "71.    海外服务器Docker"
echo "72.    大陆服务器Docker"
echo "73.    卸载docker"
echo "81.     CentOS 关闭防火墙"
echo "82.     呆梨相关--XUI"
echo "83.     呆梨相关--make"
read -p "退出请回车" menuNumberInput
  case "$menuNumberInput" in
    1 )
      	wget -O box.sh https://raw.githubusercontent.com/BlueSkyXN/SKY-BOX/main/box.sh && chmod +x box.sh && clear && ./box.sh
    ;;
    2 )
      	wget -q https://github.com/Aniverse/A/raw/i/a && bash a
    ;;
    3 )
    	bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh') -d 10 -v 64 -p "自定义root密码" -port "自定义ssh端口"
    ;;
    31 )
	bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh') -d 10 -v 64 -p "自定义root密码" -port "自定义ssh端口"
    ;;
    32 )
    	bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh') -u 20.04 -v 64 -p "自定义root密码" -port "自定义ssh端口"
    ;;
    33 )
    	wget --no-check-certificate -O AutoReinstall.sh https://git.io/AutoReinstall.sh && bash AutoReinstall.sh
    ;;
    41 )
	bash <(curl -Lso- https://bench.im/hyperspeed)
    ;;
    42 )
    	curl -fsL https://ilemonra.in/LemonBenchIntl | bash -s fast
    ;;
    43 )
        wget -qO- git.io/superbench.sh | bash
    ;;
    44 )
    	wget -qO- bench.sh | bash
    ;;
    45 )
 	bash <(wget -qO- https://bench.im/hyperspeed)
    ;;
    46 )
    	read -p "1号脚本请按001，2号脚本请按002" input46
  	case "$input46" in
    	001 )
    		curl https://raw.githubusercontent.com/zhucaidan/mtr_trace/main/mtr_trace.sh|bash || wget https://raw.githubusercontent.com/nanqinlang-script/testrace/master/testrace.sh
bash testrace.sh
	 ;;
	 002 ）
	 	 wget -q route.f2k.pub -O route && bash route || wget -qO- git.io/besttrace | bash
    	 ;;
    ;;
    47 )
    	wget -O jcnf.sh https://raw.githubusercontent.com/Netflixxp/jcnfbesttrace/main/jcnf.sh && bash jcnf.sh
    ;;
    48 )
    	read -p "1号脚本请按101，2号脚本请按102,3号脚本请按103，4号脚本请按104,25端口请按105,IPV6请按106" input48
  	case "$input48" in
	101 )
    		bash <(curl -Lso- https://git.io/superspeed_uxh)
	;;
	102 ）
	 	 bash <(curl -Lso- https://dl.233.mba/d/sh/speedtest.sh)
	;; 
	103 )
    		bash <(curl -Lso- https://git.io/J1SEh)
	;;
	104 ）
	 	bash <(wget --no-check-certificate -O- https://dl.233.mba/d/sh/superbenchpro.sh)
	;;
	105 ）
	 	telnet smtp.aol.com 25
	;;
	106 ）
		curl ip.p3terx.com
    	;;
    ;;
    49 ）
	read -p "全媒体请按201，奈飞检测请按202" input49
  	case "$input49" in
	201 )
		bash <(curl -L -s https://raw.githubusercontent.com/lmc999/RegionRestrictionCheck/main/check.sh)
        ;;
	202 )
		wget -O nf https://github.com/sjlleo/netflix-verify/releases/download/2.5/nf_2.5_linux_amd64 && chmod +x nf && clear && ./nf

        ;;
    ;;
    5 )
        wget -N --no-check-certificate https://cdn.jsdelivr.net/gh/YG-tsj/CFWarp-Pro/multi.sh && chmod +x multi.sh && ./multi.sh
    ;;
    51 )
        yum -y install ntpdate
	timedatectl set-timezone Asia/Shanghai
        ntpdate ntp1.aliyun.com
    ;;
    61 )
        wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
    ;;
    62 )
       uname -srm

    ;;
    71 )
	apt-get update && apt-get install -y wget vim
	wget -qO- get.docker.com | bash
 	sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	docker-compose --version
    ;;
    72 )
        curl -sSL https://get.daocloud.io/docker | sh
        curl -L https://get.daocloud.io/docker/compose/releases/download/v2.1.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose
    ;;
    73 )
        sudo apt-get purge docker-ce docker-ce-cli containerd.io
	sudo rm -rf /var/lib/docker
	sudo rm -rf /var/lib/containerd
    ;;
    81 )
       systemctl start supervisord
       systemctl disable firewalld
       systemctl stop firewalld
    ;;
    82 )
       bash <(curl -Ls https://raw.githubusercontent.com/sprov065/x-ui/master/install.sh) 0.2.0
    ;;
    83 )
       wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" && chmod 700 /root/install.sh && /root/install.sh
    ;;
    * )
      clear
      esac
    ;;
    esac
}

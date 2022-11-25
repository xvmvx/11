#! /bin/bash
#彩色
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}



#geng
function geng(){
    read -p "Debian/Ubuntu 系统请按1,centos请按2 ? [1/2] :" 12
      case "$12" in
    1 )
      apt-get update && apt-get upgrade && apt-get dist-upgrade
    ;;
    2 )
      yum update && yum upgrade
    ;;
    * )
      clear
      red "请输入正确数字 !"
      xitong
    ;;
    esac
}

#换源脚本·下载
function yuan(){
wget -O "/root/changesource.sh" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/changesource.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/changesource.sh"
chmod 777 "/root/changesource.sh"
blue "下载完成"
echo
green "请自行输入下面命令切换对应源"
green " =================================================="
echo
green " bash changesource.sh 切换推荐源 "
green " bash changesource.sh cn  切换中科大源 "
green " bash changesource.sh aliyun 切换阿里源 "
green " bash changesource.sh 163 切换网易源 "
green " bash changesource.sh aws 切换AWS亚马逊云源 "
green " bash changesource.sh restore 还原默认源 "
}



#中文Debian
function chinadebian(){
    wget https://www.atzlinux.com/atzlinux/download/install-all-single-script-v11.sh 
    sudo source install-all-single-script-v11.sh || sudo chmod +x install-all-single-script-v11.sh;./install-all-single-script-v11.sh
}


#amh
function amh(){
    wget http://amh.sh/file/AMH/4.2/amh.sh && chmod 775 amh.sh && ./amh.sh 2>&1 | tee amh.log
}



#vst
function vst(){
    curl -O http://vestacp.com/pub/vst-install.sh bash vst-install.sh
}

#appnode
function appnode(){
    bash -c "$(curl -sS http://dl.appnode.com/install.sh)"
}
    


#301---获取本机IP
function getip(){
echo  
curl ip.p3terx.com
echo
}




#302-----Disk Test 硬盘&系统综合测试
function disktestsh(){
wget -O "/root/disktest.sh" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/disktest.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/disktest.sh"
chmod 777 "/root/disktest.sh"
blue "下载完成"
bash "/root/disktest.sh"
}


#133-----Memorytest 内存压力测试
function memorytest(){
yum install wget -y
yum groupinstall "Development Tools" -y
wget https://raw.githubusercontent.com/FunctionClub/Memtester/master/memtester.cpp
blue "下载完成"
gcc -l stdc++ memtester.cpp
./a.out
}


#134----Lemonbench 综合测试
function Lemonbench(){
curl -fsL https://ilemonra.in/LemonBenchIntl | bash -s fast
}




#三网Speedtest测速
function 3speed(){
bash <(curl -Lso- https://raw.githubusercontent.com/BlueSkyXN/SpeedTestCN/main/superspeed.sh)
}




#202------UNIXbench 综合测试
function UNIXbench(){
wget -O "/root/unixbench.sh" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/unixbench.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/unixbench.sh"
chmod 777 "/root/unixbench.sh"
blue "下载完成"
bash "/root/unixbench.sh"
}





#213------Superbench 综合测试
function superbench(){
wget -O "/root/superbench.sh" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/superbench.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/superbench.sh"
chmod 777 "/root/superbench.sh"
blue "下载完成"
bash "/root/superbench.sh"
}




#214------Speedtest for Linux·下载
function speedtest-linux(){
wget -O "/root/speedtest" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/speedtest" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/speedtest"
chmod 777 "/root/speedtest"
blue "下载完成"
blue "输入 /root/speedtest 来运行"
}








#215------Yabs.sh测试
function yabssh(){
wget -O "/root/yabs.sh" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/yabs.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/yabs.sh"
chmod 777 "/root/yabs.sh"
blue "下载完成"
bash "/root/yabs.sh"
}





#221-----Route-trace 路由追踪测试
function rtsh(){
wget -O "/root/rt.sh" "https://raw.githubusercontent.com/BlueSkyXN/Route-trace/main/rt.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/rt.sh"
chmod 777 "/root/rt.sh"
blue "下载完成"
blue "你也可以输入 bash /root/rt.sh 来手动运行"
bash "/root/rt.sh"
}



#222------Besttrace 路由追踪·下载
function gettrace(){
wget -O "/root/besttrace" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/besttrace" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/besttrace"
chmod 777 "/root/besttrace"
blue "下载完成"
blue "输入 /root/besttrace 来运行"
}









#223------TubeCheck Google/Youtube CDN分配节点测试
function tubecheck(){
wget -O "/root/TubeCheck" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/TubeCheck" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/TubeCheck"
chmod 777 "/root/TubeCheck"
blue "下载完成"
red "识别成无信息/NULL/未知等代表为默认的美国本土地区或者不可识别/无服务的中国大陆地区"
"/root/TubeCheck"
}




#231------IPV.SH ipv4/6优先级调整一键脚本·下载
function ipvsh(){
wget -O "/root/ipv.sh" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/ipv.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/ipv.sh"
chmod 777 "/root/ipv.sh"
blue "下载完成"
blue "输入 bash /root/ipv.sh 来运行"
}




#232------IPT.SH iptable一键脚本·下载
function iptsh(){
wget -O "/root/ipt.sh" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/ipt.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/ipt.sh"
chmod 777 "/root/ipt.sh"
blue "下载完成"
blue "输入 bash /root/ipt.sh 来运行"
}






#241------MT.SH 流媒体解锁测试
function mtsh(){
        #安装JQ
	if [ -e "/etc/redhat-release" ];then
	yum install epel-release -y -q > /dev/null;
	yum install jq -y -q > /dev/null;
	elif [[ $(cat /etc/os-release | grep '^ID=') =~ ubuntu ]] || [[ $(cat /etc/os-release | grep '^ID=') =~ debian ]];then
	apt-get update -y > /dev/null;
	apt-get install jq > /dev/null;
	else 
	echo -e "${Font_Red}请手动安装jq${Font_Suffix}";
	exit;
	fi

        jq -V > /dev/null 2>&1;
        if [ $? -ne 0 ];then
	echo -e "${Font_Red}请手动安装jq${Font_Suffix}";
	exit;
        fi

wget -O "/root/mt.sh" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/mt.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/mt.sh"
chmod 777 "/root/mt.sh"
blue "下载完成"
blue "你也可以输入 bash /root/mt.sh 来手动运行"
bash /root/mt.sh
}





#242------RegionRestrictionCheck 流媒体解锁测试
function RegionRestrictionCheck(){
bash <(curl -L -s https://raw.githubusercontent.com/lmc999/RegionRestrictionCheck/main/check.sh)
}

#251------系统网络配置优化
function system-best(){
	sed -i '/net.ipv4.tcp_retries2/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_slow_start_after_idle/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_fastopen/d' /etc/sysctl.conf
	sed -i '/fs.file-max/d' /etc/sysctl.conf
	sed -i '/fs.inotify.max_user_instances/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_syncookies/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_fin_timeout/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_tw_reuse/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_syn_backlog/d' /etc/sysctl.conf
	sed -i '/net.ipv4.ip_local_port_range/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_tw_buckets/d' /etc/sysctl.conf
	sed -i '/net.ipv4.route.gc_timeout/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_synack_retries/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_syn_retries/d' /etc/sysctl.conf
	sed -i '/net.core.somaxconn/d' /etc/sysctl.conf
	sed -i '/net.core.netdev_max_backlog/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_timestamps/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_orphans/d' /etc/sysctl.conf
	sed -i '/net.ipv4.ip_forward/d' /etc/sysctl.conf

echo "net.ipv4.tcp_retries2 = 8
net.ipv4.tcp_slow_start_after_idle = 0
fs.file-max = 1000000
fs.inotify.max_user_instances = 8192
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_tw_reuse = 1
net.ipv4.ip_local_port_range = 1024 65000
net.ipv4.tcp_max_syn_backlog = 16384
net.ipv4.tcp_max_tw_buckets = 6000
net.ipv4.route.gc_timeout = 100
net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_synack_retries = 1
net.core.somaxconn = 32768
net.core.netdev_max_backlog = 32768
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_max_orphans = 32768
# forward ipv4
#net.ipv4.ip_forward = 1">>/etc/sysctl.conf
sysctl -p
	echo "*               soft    nofile           1000000
*               hard    nofile          1000000">/etc/security/limits.conf
	echo "ulimit -SHn 1000000">>/etc/profile
	read -p "需要重启VPS后，才能生效系统优化配置，是否现在重启 ? [Y/n] :" yn
	[ -z "${yn}" ] && yn="y"
	if [[ $yn == [Yy] ]]; then
		echo -e "${Info} VPS 重启中..."
		reboot
	fi
}




#252------安装最新BBR内核·使用YUM
function bbrnew(){
wget -O "/root/bbr.sh" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/bbr.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/bbr.sh"
chmod 777 "/root/bbr.sh"
blue "下载完成，开始运行"
bash "/root/bbr.sh"
blue "BBR内核安装结束，开始修复grub"
yum install -y grub
grub-mkconfig -o /boot/grub/grub.conf
yum install -y grub2
grub2-mkconfig -o /boot/grub2/grub.cfg
blue "修复grub完成，显示内核参数如下"
echo " =================================================="
yellow "当前正在使用的内核"
uname -a
echo " =================================================="
yellow "系统已经安装的全部内核"
rpm -qa | grep kernel
echo " =================================================="
yellow "可使用的内核列表"
awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg
echo " =================================================="
yellow "当前默认内核启动项"
echo
grub2-editenv list
echo " =================================================="
yellow "请自行重启后启动BBR加速"
echo " =================================================="

}





#253------启动BBR FQ算法
function bbrfq(){
remove_bbr_lotserver
	echo "net.core.default_qdisc=fq" >> /etc/sysctl.d/99-sysctl.conf
	echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.d/99-sysctl.conf
	sysctl --system
	echo -e "BBR+FQ修改成功，重启生效！"
}



#311------宝塔面板综合安装脚本
function btbox(){
wget -O "/root/btbox.sh" "https://raw.githubusercontent.com/BlueSkyXN/SKY-BOX/main/btbox.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/btbox.sh"
chmod 777 "/root/btbox.sh"
blue "下载完成"
bash "/root/btbox.sh"
}





#312------NEZHA.SH哪吒面板/探针·下载
function nezha(){
wget -O "/root/nezha.sh" "https://raw.githubusercontent.com/BlueSkyXN/nezha/master/script/install.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/nezha.sh"
chmod 777 "/root/nezha.sh"
blue "你也可以输入 bash /root/nezha.sh 来手动运行"
blue "下载完成"
bash "/root/nezha.sh"
}




#313------宝塔面板 自动磁盘挂载工具
function btdisk(){
wget -O auto_disk.sh http://download.bt.cn/tools/auto_disk.sh && bash auto_disk.sh
}






#321------Rclone官方一键安装脚本
function rc(){
curl https://rclone.org/install.sh | sudo bash
}







#322------Rclone版&Fclone·下载
function clonesh(){
wget -O "/usr/bin/rclone" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/rcloneamd" --no-check-certificate -T 30 -t 5 -d
wget -O "/usr/bin/fclone" "https://raw.githubusercontent.com/BlueSkyXN/RcloneX/master/fclone" --no-check-certificate -T 30 -t 5 -d
chmod +x "/usr/bin/rclone"
chmod +x "/usr/bin/fclone"
chmod 777 "/usr/bin/rclone"
chmod 777 "/usr/bin/fclone"
}


#331------BBR一键管理脚本
function tcpsh(){
wget -O "/root/tcp.sh" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/tcp.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/tcp.sh"
chmod 777 "/root/tcp.sh"
blue "下载完成"
blue "你也可以输入 bash /root/tcp.sh 来手动运行"
bash "/root/tcp.sh"
}

#332------加速BBR+锐速不卸载内核一键安装脚本
function bbr1(){
    wget -N --no-check-certificate "https://github.000060000.xyz/tcpx.sh"; chmod +x tcpx.sh
}
    
    
#333------加速BBR+锐速卸载内核一键安装脚本
function bbr2(){
    wget -N --no-check-certificate "https://github.000060000.xyz/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
}
    


    
#341------MTP&TLS 一键脚本
function mtp(){
wget -O "/root/mtp.sh" "https://raw.githubusercontent.com/sunpma/mtp/master/mtproxy.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/mtp.sh"
chmod 777 "/root/mtp.sh"
blue "你也可以输入 bash /root/mtp.sh 来手动运行"
blue "下载完成"
bash "/root/mtp.sh"
}    
    
    
    
    
#342------SWAP一键安装/卸载脚本
function swapsh(){
wget -O "/root/swap.sh" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/swap.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/swap.sh"
chmod 777 "/root/swap.sh"
blue "下载完成"
blue "你也可以输入 bash /root/swap.sh 来手动运行"
bash "/root/swap.sh"
}




#343------Aria2 最强安装与管理脚本
function aria(){
wget -O "/root/aria2.sh" "https://raw.githubusercontent.com/P3TERX/aria2.sh/master/aria2.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/aria2.sh"
chmod 777 "/root/aria2.sh"
blue "你也可以输入 bash /root/aria2.sh 来手动运行"
blue "下载完成"
bash "/root/aria2.sh"
}




#344------F2B一键安装脚本
function f2bsh(){
red "卸载请 运行 wget https://raw.githubusercontent.com/FunctionClub/Fail2ban/master/uninstall.sh && bash uninstall.sh"
wget https://raw.githubusercontent.com/FunctionClub/Fail2ban/master/fail2ban.sh && bash fail2ban.sh 2>&1 | tee fail2ban.log
red "卸载请 运行 wget https://raw.githubusercontent.com/FunctionClub/Fail2ban/master/uninstall.sh && bash uninstall.sh"
}





#345------axel多线程下载
function axel(){
    wget http://66-ai.com/download/script-litte-prince/app/axel-install.sh -O /root/axel-install.sh && sh axel-install.sh
}





#346------Git 新版 安装
function yumgitsh(){
wget -O "/root/yum-git.sh" "https://raw.githubusercontent.com/BlueSkyXN/Yum-Git/main/yum-git.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/yum-git.sh"
chmod 777 "/root/yum-git.sh"
blue "下载完成"
blue "你也可以输入 bash /root/yum-git.sh 来手动运行"
bash "/root/yum-git.sh"
}





#347-------java
function java(){
    wget http://66-ai.com/download/script-litte-prince/app/install-java.sh -O /root/install-java.sh && sh install-java.sh
}





#348------python3一键安装脚本
function python3(){
    wget http://66-ai.com/download/script-litte-prince/app/install-python3.sh -O /root/install-python3.sh  && sh install-python3.sh
 }
 
 
 
 
#349------万能解压
function jieya(){
    wget http://66-ai.com/download/script-litte-prince/tools/jieya.sh -O /root/jieya.sh 
}



#3------app
function app(){
    clear
    red "#######################################################################
    red "#                                                                     #
    red "#                         3.   应用快速安装                             #
    red "#                                                                     #
    red "####################################################################### 
  green "======================================================================="
  green "=========1.面板  311.宝塔面板  312.哪吒面板   313.宝塔磁盘挂载     ========="
  green "=========2.RClone  321.官方  322.新版本                        ========="  
  green "=========3.BBR  331.综合  332.加速(卸载内核)  333.不卸载          ========="  
  green "=========4.其他  341.mtp      342.swap       343.Aria   344.F2B========="  
  green "=========  345.axel  346.不算  347.java  348.python3  349.万能解压======="
  green "======================================================================="    
  echo
    read -p "请输入数字:" app
    case "$app" in
        311 )
           btbox
	;;
        312 )
           nezha
	;;
        313 )
           btdisk
	;;
        321 )
           rc
    ;;
        322 )
           clonesh
    ;;
        331 )
           tcpsh
    ;;
        332 )
           bbr1
    ;;
    
        333 )
           bbr2
    ;;
        341 )
            mtp
    ;;

        342 )
            swapsh
    ;;
        343 )
            aria
    ;;
        344 )
            f2bsh
    ;;
    
        345 )
           axel
    ;;
        346 )
            yumgitsh
    ;;

        347 )
            java
    ;;
        348 )
            python3
    ;;
        349 )
            jieya
    ;;
        * )
            clear
            red "请输入正确数字 !"
            app
    ;;

    }
    app "first"
    
    
#2------网络
function xitong(){
    clear
    red "#######################################################################
    red "#                                                                     #
    red "#                         2.   网络 相关                               #
    red "#                                                                     #
    red "####################################################################### 
  green "======================================================================="
  green "=========1.测试  211.三网测速  212.UNI综合测试    213.superbench测试 ======"
  green "=========       214.Speed测速    215.Yabs.sh测试               ========="  
  green "=========2.路由  221.路由追踪测试  222.路由追踪·下载  223.CDN分配节点测试=====" 
  green "=========3.IP  231.ipv4/6优先级调整  232.iptable下载            ========="  
  green "=========4.流媒体   241.MT.SH 流媒体     242.  流媒体解锁测试     ========="  
  green "=========5.优化  251.系统整体优化   252.BBR   253.FQ-BBR        ========="
  green "======================================================================="    
  echo
    read -p "请输入数字:" wangluo
    case "$wangluo" in
        211 )
           3speed
	;;
        212 )
           UNIXbench
	;;
        213 )
           superbench
    ;;
        214 )
            speedtest-linux
    ;;
        215 )
           yabssh
    ;;
        221 )
           rtsh
    ;;
        222 )
           gettrace
    ;;
        223 )
           tubecheck
    ;;
    
        231 )
           ipvsh
    ;;
        232 )
            iptsh
    ;;
        241 )
            mtsh
     ;;
        242 )
            RegionRestrictionCheck
     ;;
        251 )
            system-best
     ;;
        252 )
            bbrnew
     ;;
        253 )
            bbrfq
     ;;
     
     
            * )
            clear
            red "请输入正确数字 !"
            wangluo
    ;;
    esac
    }
    wangluo "first"
    
#xitong
function xitong(){
    clear
    red "#######################################################################
    red "#                                                                     #
    red "#                         1.   X86   系统                              #
    red "#                                                                     #
    red "####################################################################### 
  green "======================================================================="
  green "=========1.升级  111.更新  112.更换源                           ========="
  green "=========2.镜像  121.中文Debian  122.vst  123.appnode  124.ahm ========="  
  green "=========                重新安装系统所用                        ========="  
  green "=========3.测试  131.本机IP  132.硬盘  133.内存    134.综合测试   ========="  
  green "=========5.其他内容                                            ========="  
  green "=========6.相关帮助                                            ========="
  green "======================================================================="    
  echo
    read -p "请输入数字:" xitong
    case "$xitong" in
        111 )
           geng
	;;
        112 )
           yuan
	;;
        121 )
           chinadebian
    ;;
        122 )
           vst
    ;;
        123 )
           appnode
    ;;
        124 )
           amh
    ;;
    
        131 )
           appnode
    ;;
        132 )
            disktestsh
    ;;

        133 )
            memorytest
    ;;
        134 )
            Lemonbench
    ;;
        * )
            clear
            red "请输入正确数字 !"
            x86
    ;;
    esac
    }
    x86 "first"

#ram
function ram(){
    clear
    red "#######################################################################
    red "#                                                                     #
    red "#                     ram   系统 仍在开发中                             #
    red "#                                                                     #
    red "####################################################################### 
  green "======================================================================="
   start_menu
}

#主菜单
function x86(){
    clear
    red "#######################################################################
    red "#                                                                     #
    red "#                          X86   系统                                  #
    red "#                                                                     #
    red "####################################################################### 
  green "======================================================================="
  green "=========1.系统相关                                            ========="
  green "=========2.网络检测                                            ========="  
  green "=========3.环境布署                                            ========="  
  green "=========4.应用安装                                            ========="  
  green "=========5.其他内容                                            ========="  
  green "=========6.相关帮助                                            ========="
  green "======================================================================="    
  echo
    read -p "请输入数字:" x86
    case "$x86" in
        1 )
           xitong
	;;
        2 )
           wangluo
	;;
        3 )
           huanjing
    ;;
        4 )
           app
    ;;
        5 )
           other
    ;;
        6 )
           help
    ;;
        * )
            clear
            red "请输入正确数字 !"
            x86
    ;;
    esac
    }
    x86 "first"

#主菜单
function start_menu(){
    clear
    red "#######################################################################
    red "#                                                                     #
    red "#                          My 工具箱                                   #
    red "#                                                                     #
    red "####################################################################### 
  green "======================================================================="
  green "=========           X86系统 请按y;RAM系统 请按n;其他系统暂不支持   ========="
  green "======================================================================="    
  echo
  read -p "请输入选择:" menuNumberInput
  case "$menuNumberInput" in
    y )
      x86
    ;;
    n )
      ram
    ;;
    * )
      clear
      red "请输入正确数字 !"
      start_menu
    ;;
    esac
}
    start_menu "first"
    

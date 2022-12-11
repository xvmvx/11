#!/bin/bash
echo "#######################################################################"
xitong=$(cat /etc/issue)
IP=$(curl ip.sb)
CentOS="CentOS"
echo -n "本机系统是：" ; echo ${xitong%(Final)*}
result=$(echo $xitong | grep "${CentOS}")
if [[ "$result" != "" ]]
then
    echo "本机IP请使用ifconfig -a 检测"
else
    echo -n "本机IP是："; echo ${IP}
fi
read IP
  case "$IP" in
  45.43.57.207 )
  	VSP="UCLOUD:chenlang1940@163.com:Ab123456."
	server="PHP+bt+昊昊.中国+com--x.com"
  ;;
  121.37.203.3 )
  	VSP="华为☁️:hw17604827824:Ab123456"
	server="VOS3000"
  ;;
  124.71.218.178 )
  	VSP="华为☁️:hw752541:Ab123456"
	server="猫网页聊天"
  ;;
  139.9.73.181 )
  	VSP="华为☁️:hw13318275344:Ab123456"
	server="不详"
  ;;
  121.11.114.77 )
  	VSP="天冀☁️:2580456@qq.com:Tzq.2580"
	server="不详"
  ;;
  1.117.233.33 )
  	VSP="腾讯☁️:ijqomv@163.com:one@12345"
	server="FreePBX"
  ;;
  1.116.119.155 )
  	VSP="腾讯☁️:dakqf76@163.com:qwer1234."
	server="XSwitch"
  ;;
  80.251.214.252 )
  	VSP="搬瓦工:dakqf76@163.com:qwer1234."
	server="NPM"
  ;;
echo -n "本机服务商信息:"; echo ${VSP}
echo -n "本机运行服务信息：已启用"; echo ${server}
echo "======================================================================"
alias find="find . -name"
echo "本机已启用的命令别名"
alias
echo "alias显示全部别名，unalias lt删除别名"
echo "======================================================================"
echo "               My goodway "
echo "#######################################################################"
echo " "
echo " "
echo " "
echo "1.添加显示本窗口  2.修改本机服务商信息和运行服务信息"
echo "3.运行综合工具箱      4.运行超级工具箱    5. 性能测试 综合测试 视频测试"
echo "6. 网络测试 速度测试      7. DD WARP BBR      8. Docker和其他"
read -p "退出请回车" menuNumberInput
  case "$menuNumberInput" in
    1 )
      	vim /etc/profile
    ;;
    2 )
        vim /root/1/1.sh
    ;;
    3 )
        wget -O box.sh https://raw.githubusercontent.com/BlueSkyXN/SKY-BOX/main/box.sh && chmod +x box.sh && clear && ./box.sh
    ;;
    4 )
    	
    ;;
    5 )
	source 15.sh
    ;;
    6 )
       source 16.sh
    ;;
    7 )
       source 17.sh
    ;;
    8 )
       source 18.sh
    ;;
    9 )
       source 19.sh
    ;;
    * )
      clear
      esac
    ;;
    esac

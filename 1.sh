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
echo "本机服务商信息:请vim修改/etc/profile文件的末尾添加"
echo "本机运行服务信息：已启用   VOS3000"
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
        vim /root/1.sh
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

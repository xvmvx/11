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
echo "#######################################################################"
echo "1.  综合工具箱"
echo "2.  杜甫测试"
echo "3.  系统测试"
echo "4.  速度测试"
echo "5.  媒体测试 "
echo "6.  WARP"
echo "7.  BBR"
echo "8.  DD"
echo "9.  DOCKER"
echo "0.  其他"

read -p "退出请回车" menuNumberInput
  case "$menuNumberInput" in
    1 )
      	wget -O box.sh https://raw.githubusercontent.com/BlueSkyXN/SKY-BOX/main/box.sh && chmod +x box.sh && clear && ./box.sh
    ;;
    2 )
      	wget -q https://github.com/Aniverse/A/raw/i/a && bash a
    ;;
    3 )
    	  bash 13.sh
    ;; 
    4 )
        bash 14.sh
    ;; 
    5 ) 
        bash 15.sh
    ;; 
    6 )
        bash 16.sh
    ;;
    7 )
      	 bash 17.sh
    ;;
    8 )
    	  bash 18.sh
    ;; 
    9 )
        bash 19.sh
    ;; 
    0 ) 
        bash 00.sh
    ;; 

    * )
      clear
      esac
    ;;
    esac
}

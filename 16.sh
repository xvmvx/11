#!/bin/bash
echo "#######################################################################"
echo "              网络测试       速度测试          "
echo "======================================================================"
echo "1.显示延迟、抖动 2.四网测速 3.三网测速 "
echo "4.三网1 5.三网 6.三网 7.25端口 8.IPV6 "
echo "#######################################################################"
echo "  "
read -p "返回上层请按 0  ，退出请回车" menuNumberInput
  case "$menuNumberInput" in
    1 )
      	bash <(curl -Lso- https://bench.im/hyperspeed)
    ;;
    2 )
      	bash <(wget -qO- https://bench.im/hyperspeed)
    ;;
    3 )
    	wget -O jcnf.sh https://raw.githubusercontent.com/Netflixxp/jcnfbesttrace/main/jcnf.sh && bash jcnf.sh
    ;;
    4 )
        bash <(curl -Lso- https://git.io/superspeed_uxh)
	;;
    5 )
    	bash <(curl -Lso- https://dl.233.mba/d/sh/speedtest.sh)
    ;;
    6 )
    	bash <(curl -Lso- https://git.io/J1SEh)
    ;;
    7 )
        bash <(wget --no-check-certificate -O- https://dl.233.mba/d/sh/superbenchpro.sh)
    ;;
    8 )
    	telnet smtp.aol.com 25
    ;;
    9 )
        curl ip.p3terx.com
    ;;
    0 )
    	source ./1.sh
    ;;
    * )
      clear
      esac
    ;;
    esac
}

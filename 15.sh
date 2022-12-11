#!/bin/bash
echo "#######################################################################"
echo "              性能测试 综合测试 视频测试          "
echo "======================================================================"
echo "1.杜甫测试     2.单线程测试     3.最全测速脚本     4.superbench"
echo "5.Bench.sh    6.流媒体测试     7.奈飞检测        8.回程测试"
echo "9.直接显示回程线路"
echo "#######################################################################"
echo "  "
read -p "返回上层请按 0  ，退出请回车" menuNumberInput
  case "$menuNumberInput" in
    1 )
      	wget -q https://github.com/Aniverse/A/raw/i/a && bash a
    ;;
    2 )
      	bash <(curl -Lso- https://bench.im/hyperspeed)
    ;;
    3 )
    	curl -fsL https://ilemonra.in/LemonBenchIntl | bash -s fast
    ;;
    4 )
	wget -qO- git.io/superbench.sh | bash
    ;;
    5 )
    	wget -qO- bench.sh | bash
    ;;
    6 )
    	bash <(curl -L -s https://raw.githubusercontent.com/lmc999/RegionRestrictionCheck/main/check.sh)
    ;;
    7 )
	wget -O nf https://github.com/sjlleo/netflix-verify/releases/download/2.5/nf_2.5_linux_amd64 && chmod +x nf && clear && ./nf
    ;;
    8 )
    	curl https://raw.githubusercontent.com/zhucaidan/mtr_trace/main/mtr_trace.sh|bash || wget https://raw.githubusercontent.com/nanqinlang-script/testrace/master/testrace.sh
bash testrace.sh
    ;;
    9 )
        wget -q route.f2k.pub -O route && bash route || wget -qO- git.io/besttrace | bash
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

#!/bin/bash
#彩色
red(){echo -e "\033[31m\033[01m$1\033[0m"}
green(){echo -e "\033[32m\033[01m$1\033[0m"}
yellow(){echo -e "\033[33m\033[01m$1\033[0m"}
blue(){echo -e "\033[34m\033[01m$1\033[0m"}

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

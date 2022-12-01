#!/bin/bash
#彩色
red(){echo -e "\033[31m\033[01m$1\033[0m"}
green(){echo -e "\033[32m\033[01m$1\033[0m"}
yellow(){echo -e "\033[33m\033[01m$1\033[0m"}
blue(){echo -e "\033[34m\033[01m$1\033[0m"}

#开始
echo -n "国内服务器安装请按1,国外请按2,一键安装请按3"
read shuzi
case  "$shuzi" in
  1 )
    echo "开始安装docker..."
    wget -qO- get.docker.com | bash
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "安装完成,docker版本"
    docker -v  && docker-compose --version
    if [ "$?" = "0" ]; then
      echo "设置开机自动启动及IP6"
      systemctl enable docker  # 设置开机自动启动
      cat > /etc/docker/daemon.json <<EOF
      {
          "log-driver": "json-file",
          "log-opts": {
              "max-size": "20m",
              "max-file": "3"
          },
          "ipv6": true,
          "fixed-cidr-v6": "fd00:dead:beef:c0::/80",
          "experimental":true,
          "ip6tables":true
      }
      EOF
      systemctl restart docker
    else
      echo "安装失败！" 1>&2
      exit 1
  fi
  ;;
  2 )
    echo "开始安装docker..."
    curl -sSL https://get.daocloud.io/docker | sh
    curl -L https://get.daocloud.io/docker/compose/releases/download/v2.1.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    echo "安装完成,docker版本"
    docker -v  && docker-compose --version
    if [ "$?" = "0" ]; then
      echo "设置开机自动启动及IP6"
      systemctl enable docker  # 设置开机自动启动
      cat > /etc/docker/daemon.json <<EOF
      {
          "log-driver": "json-file",
          "log-opts": {
              "max-size": "20m",
              "max-file": "3"
          },
          "ipv6": true,
          "fixed-cidr-v6": "fd00:dead:beef:c0::/80",
          "experimental":true,
          "ip6tables":true
      }
      EOF
      systemctl restart docker
    else
      echo "安装失败！" 1>&2
      exit 1
    fi
  ;;
  3 )
    chmod +x d.sh && ./d.sh
  ;;

#!/bin/bash
echo -n "debian输入1,ubuntu输入2,其他3）> "
read character
if [ "$character" = "1" ]; then
  sudo mv /etc/apt/sources.list /etc/apt/sources.list && sudo tee /etc/apt/sources.list <<-'EOF'
  {
  deb http://mirrors.163.com/debian/ buster main non-free contrib
  deb http://mirrors.163.com/debian/ buster-updates main non-free contrib
  # deb http://mirrors.163.com/debian/ buster-backports main non-free contrib
  deb-src http://mirrors.163.com/debian/ buster main non-free contrib
  # deb-src http://mirrors.163.com/debian/ buster-updates main non-free contrib
  deb-src http://mirrors.163.com/debian/ buster-backports main non-free contrib
  deb http://mirrors.163.com/debian-security/ buster/updates main non-free contrib
  deb-src http://mirrors.163.com/debian-security/ buster/updates main non-free contrib
  }
  EOF
  if [ "$?" = "0" ]; then
    sudo apt-get update && sudo apt-get install locales
  else
    echo "无法切换源！" 1>&2
    exit 1
  fi
  read -p "en_US.UTF-8和下面四个中文相关的都要选择,再按ok确定..第二个选择 zh_CN.UTF-8 并确定"
  sudo dpkg-reconfigure locales
      echo "请重启"
elif [ "$character" = "2" ]; then
  apt-get update && apt-get install language-pack-zh-hans
  if [ "$character" = "1" ]; then
  sudo mv /etc/default/locale  /etc/default/locale.beifen  && sudo tee /etc/default/locale <<-'EOF'
{
LANG="zh_CN.UTF-8"
LANGUAGE="zh_CN:zh"
LC_NUMERIC="zh_CN"
LC_TIME="zh_CN"
LC_MONETARY="zh_CN"
LC_PAPER="zh_CN"
LC_NAME="zh_CN"
LC_ADDRESS="zh_CN"
LC_TELEPHONE="zh_CN"
LC_MEASUREMENT="zh_CN"
LC_IDENTIFICATION="zh_CN"
LC_ALL="zh_CN.UTF-8"
}
EOF
sudo mv /etc/environment /etc/environment.beiren  && sudo tee /etc/environment <<-'EOF'
{
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
LANG="zh_CN.UTF-8"
LANGUAGE="zh_CN:zh"
LC_NUMERIC="zh_CN"
LC_TIME="zh_CN"
LC_MONETARY="zh_CN"
LC_PAPER="zh_CN"
LC_NAME="zh_CN"
LC_ADDRESS="zh_CN"
LC_TELEPHONE="zh_CN"
LC_MEASUREMENT="zh_CN"
LC_IDENTIFICATION="zh_CN"
LC_ALL="zh_CN.UTF-8"
}
EOF
elif [ "$character" = "3" ]; then
    echo 输入不符合要求
fi

#!/bin/bash
if ! which wget 2>&1 &>/dev/null || ! which unzip 2>&1 &>/dev/null ;then
    echo '需要安装： wget 和 unzip 进行下载和解压！'
    exit 1
fi
if [ ! -d "shell-master" ];then
    wget --no-check-certificate -O master.zip https://github.com/ttlxihuan/shell/archive/master.zip
    if [ $? != '0' ];then
        echo '下载脚本包失败！'
        exit 1
    fi
    unzip master.zip
fi
cd shell-master
find ./ -maxdepth 3 ! -path '*/temp/*' -type f -exec sed -i 's/\r//' {} \;
for NAME in ${@:1}; do
    nohup bash run.sh $NAME 2>&1 &> ../$NAME.log &
done
exit 0

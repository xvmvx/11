# 官方
- apt-get remove docker docker-engine docker.io containerd run
- sudo apt-get update
- sudo apt-get install ca-certificates curl gnupg lsb-release
- sudo mkdir -p /etc/apt/keyrings
- curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
- echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
- $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
- sudo apt-get update
- sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
# 常用
- sudo -i  # 切换到root用户 
- passwd root  # 修改root密码 
- apt update -y  # 升级 
- apt install wget curl sudo vim git -y   # 安装常用的软件 
- wget -O box.sh https://raw.githubusercontent.com/BlueSkyXN/SKY-BOX/main/box.sh && chmod +x box.sh && clear && ./box.sh # SWAG 选18
- curl ifconfig.me  # 查看当前服务器IP：
- ip addr show docker0  # 查看Docker容器内部IP：
- lsof -i:8080  #查看8080端口
## npm忘记密码
docker exec -it nginxproxymanager_db_1 sh  # nginxproxymanager_db_1这边改成你自己的容器名，可以通过docker ps 查看到
mysql -u root -p
#  快速
## 非大陆
- wget -qO- get.docker.com | bash #Docker
- sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose  #Docker-compose
- docker version && docker-compose version  #查看版本
- sudo chmod +x /usr/local/bin/docker-compose 
- systemctl enable docker  # 设置开机自动启动
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


# 在Debian 11上使用Matrix Synapse和Element创建聊天服务器
Matrix是一个用于分散和端到端加密通信的开放标准。它使用通过因特网相互通信的本地服务器进行联合。主服务器存储关于用户的数据和创建的房间的聊天历史(包括来自其他主服务器的房间)。由于去中心化的特性，当创建一个房间的原始主服务器离线时，其他主服务器可以毫无问题地继续通信。由于这种设计，没有单点故障。
Synapse是由Matrix.org团队创建的Matrix主服务器的参考实现，也是最流行、最成熟、最完整的实现。
在遵循本指南时，用您的域名替换所有出现的example.org。
## 先决条件
Debian 11实例
可选下载Element和Coturn的IPv4地址
更新服务器
创建一个具有sudo权限的非root用户
点矩阵，元素，并将子域转到您的服务器
## 1. 安装突触

### 添加Matrix.org apt存储库。

```
sudo wget -O /usr/share/keyrings/matrix-org-archive-keyring.gpg https://packages.matrix.org/debian/matrix-org-archive-keyring.gpg $ echo "deb [signed-by=/usr/share/keyrings/matrix-org-archive-keyring.gpg] https://packages.matrix.org/debian/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/matrix-org.list
``` 
### 安装突触。

```
sudo apt update $ sudo apt install matrix-synapse-py3
```
在安装过程中，输入主服务器的名称，这是您的Matrix ID的一部分。您可以稍后在/etc/matrix-synapse/conf.d/server_name.yaml中对此进行更改。

## 2. 安装和配置PostgreSQL

尽管Synapse支持使用SQLite作为数据库，但由于性能问题，不建议在生产环境中使用。

```
sudo apt install postgresql
```

以PostgreSQL用户登录。
```
sudo -su postgres
```
为PostgreSQL创建一个用户突触和一个数据库突触。


```
createuser --pwprompt synapse $ createdb --encoding=UTF8 --locale=C --template=template0 --owner=synapse synapse
```
Leave the postgres account.

```
exit
```
## 3. Install and Configure Nginx with TLS

Synapse支持在没有反向代理的情况下独立运行，但在生产中不建议运行。

安装Nginx和Certbot。

```
sudo apt install nginx certbot python3-certbot-nginx
```
打开防火墙中的HTTP、HTTPS和突触端口。

```
sudo ufw allow http $ sudo ufw allow https $ sudo ufw allow 8448
```
从Let's Encrypt获取TLS证书。

```
sudo certbot certonly --nginx -d matrix.example.org -d example.org
```
创建一个新的Nginx配置文件。

```
sudo nano /etc/nginx/sites-available/synapse
```
将以下行添加到配置文件中。
```
server { 
    server_name matrix.example.org; 
    
    # Client port 
    listen 80; 
    listen [::]:80; 
    
    return 301 https://$host$request_uri; 
} 

server { 
    server_name matrix.example.org; 
    
    # Client port 
    listen 443 ssl http2; 
    listen [::]:443 ssl http2; 
    
    # Federation port 
    listen 8448 ssl; 
    listen [::]:8448 ssl; 
    
    # TLS configuration 
    ssl_certificate /etc/letsencrypt/live/matrix.example.org/fullchain.pem; 
    ssl_certificate_key /etc/letsencrypt/live/matrix.example.org/privkey.pem; 
    ssl_protocols TLSv1.2 TLSv1.3; 
    ssl_prefer_server_ciphers on; 
    
    location ~ ^(/_matrix|/_synapse/client) { 
        proxy_pass http://localhost:8008; 
        proxy_http_version 1.1; 
        
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header X-Forwarded-Proto $scheme; 
        proxy_set_header Host $host; 
        
        #默认的Synapse上传大小。
        #如果你改变了Synapse配置中的max_upload_size，请在这里更新它。client_max_body_size 50M; 
        }
}
        
```
如果在Synapse安装（example.org）期间设置的矩阵服务器名称的DNS记录指向托管Synapse（matrix.example.org的同一服务器的IP地址，请在/etc/nginx/sites-available/synapse的末尾添加以下行。如果没有，请在Nginx配置文件的适当位置的其他服务器（example.org）上添加以下行。
```
server {
    server_name example.org;

    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    # TLS configuration
    ssl_certificate /etc/letsencrypt/live/matrix.example.org/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/matrix.example.org/privkey.pem;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;

    # Redirect
    location ~ ^(/_matrix|/_synapse/client) {
            return 301 "https://matrix.example.org$request_uri";
    }

    # Client homeserver autodiscovery
    location /.well-known/matrix/client {
        default_type application/json;
        add_header Access-Control-Allow-Origin *;

        return 200 '{ "m.homeserver": { "base_url": "https://matrix.example.org" } }';
    }

    # Domain delegation
    location /.well-known/matrix/server {
        default_type application/json;
        add_header Access-Control-Allow-Origin *;

        return 200 '{ "m.server": "matrix.example.org" }';
    }
}

```

启用配置。

```
sudo ln -s /etc/nginx/sites-available/synapse /etc/nginx/sites-enabled

```
重新加载Nginx配置。
```
sudo systemctl reload nginx.service
```
## 4.配置突触
您可以在/etc/matrix-synapse/homeserver.yaml上编辑配置文件，但您应该在/etc/matrix-synapse/conf.d/中进行更改，这样apt就不会要求在每次更新Synapse后覆盖配置文件。

### 创建一个新的数据库配置文件。

```
sudo nano /etc/matrix-synapse/conf.d/database.yaml
```
A将以下行添加到配置文件中。将password值替换为之前为PostgreSQLsynapse用户设置的密码。如果您在另一台服务器上托管PostgreSQL，请将localhost替换为其地址。
```
database:
  name: psycopg2
  args:
    user: synapse
    password: 'password'
    database: synapse
    host: localhost
    cp_min: 5
    cp_max: 10
```
创建一个秘密注册密钥。保持安全，因为任何拥有密钥的人都可以注册新用户，即使注册被禁用。

```
echo "registration_shared_secret: '$(cat /dev/urandom | tr -cd '[:alnum:]' | fold -w 256 | head -n 1)'" | sudo tee /etc/matrix-synapse/conf.d/registration_shared_secret.yaml

```
默认情况下，Synapse启用了显示某人是否在线的存在指标。这可能会导致CPU使用率高，许多家庭服务器禁用它们。为此，请创建一个新的配置文件。

```
sudo nano /etc/matrix-synapse/conf.d/presence.yaml
```
将以下行添加到配置文件中。
```
presence:
  enabled: false
```

重新启动突触以应用新配置。

```
sudo systemctl restart matrix-synapse.service
``` 
创建一个新的矩阵用户。

```
register_new_matrix_user -c /etc/matrix-synapse/conf.d/registration_shared_secret.yaml http://localhost:8008

```
要打开公共注册，请创建一个新配置。

```
sudo nano /etc/matrix-synapse/conf.d/registration.yaml
```
将以下行添加到配置文件中。

```
enable_registration: true
```
默认情况下，Synapse不允许未经验证注册。要启用电子邮件验证，请添加以下行。

```
registrations_require_3pid:
  - email

email:
  smtp_host: mail.example.org
  smtp_port: 587

  # If mail server has no authentication, skip these 2 lines
  smtp_user: 'noreply@example.org'
  smtp_pass: 'password'

  # Optional, require encryption with STARTTLS
  require_transport_security: true

  app_name: 'Example Chat'  # defines value for %(app)s in notif_from and email subject
  notif_from: "%(app)s <noreply@example.org>"

```
要没有任何形式的验证，请添加以下行。

```
enable_registration_without_verification: true
```
重新启动“突触”以应用新的配置。

```
sudo systemctl restart matrix-synapse.service
```
要验证Synapse是否正在运行，请在浏览器中的Matrix域上打开/_matrix/static/。例如：

https://matrix.example.org/\_matrix/static/
要检查与其他家庭服务器的联合是否正常工作，请打开联邦测试仪，键入您的矩阵服务器名称，然后单击“转到”。

## 5.安装和配置库恩

您通常需要在NAT（TURN）服务器周围使用中继的遍历，才能使语音和视频通话正常工作。如果您不需要此功能，您可以跳过此部分。

安装Coturn。

```sudo apt install coturn```
打开TURN和UDP防火墙端口。
```
$ sudo ufw allow 3478
$ sudo ufw allow 5349
$ sudo ufw allow 49152:65535/udp
```
从Let's Encrypt获取TLS证书。

```
sudo certbot certonly --nginx -d turn.example.org
```
生成一个身份验证密钥。

```
echo "static-auth-secret=$(cat /dev/urandom | tr -cd '[:alnum:]' | fold -w 256 | head -n 1)" | sudo tee /etc/turnserver.conf
```
编辑配置文件。

```
sudo nano /etc/turnserver.conf
```
将以下行添加到配置文件中。

```
use-auth-secret
realm=turn.example.org
cert=/etc/letsencrypt/live/turn.example.org/fullchain.pem
pkey=/etc/letsencrypt/live/turn.example.org/privkey.pem


# VoIP is UDP, no need for TCP
no-tcp-relay

# Do not allow traffic to private IP ranges
no-multicast-peers
denied-peer-ip=0.0.0.0-0.255.255.255
denied-peer-ip=10.0.0.0-10.255.255.255
denied-peer-ip=100.64.0.0-100.127.255.255
denied-peer-ip=127.0.0.0-127.255.255.255
denied-peer-ip=169.254.0.0-169.254.255.255
denied-peer-ip=172.16.0.0-172.31.255.255
denied-peer-ip=192.0.0.0-192.0.0.255
denied-peer-ip=192.0.2.0-192.0.2.255
denied-peer-ip=192.88.99.0-192.88.99.255
denied-peer-ip=192.168.0.0-192.168.255.255
denied-peer-ip=198.18.0.0-198.19.255.255
denied-peer-ip=198.51.100.0-198.51.100.255
denied-peer-ip=203.0.113.0-203.0.113.255
denied-peer-ip=240.0.0.0-255.255.255.255
denied-peer-ip=::1
denied-peer-ip=64:ff9b::-64:ff9b::ffff:ffff
denied-peer-ip=::ffff:0.0.0.0-::ffff:255.255.255.255
denied-peer-ip=100::-100::ffff:ffff:ffff:ffff
denied-peer-ip=2001::-2001:1ff:ffff:ffff:ffff:ffff:ffff:ffff
denied-peer-ip=2002::-2002:ffff:ffff:ffff:ffff:ffff:ffff:ffff
denied-peer-ip=fc00::-fdff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
denied-peer-ip=fe80::-febf:ffff:ffff:ffff:ffff:ffff:ffff:ffff

# Limit number of sessions per user
user-quota=12
# Limit total number of sessions
total-quota=1200
```
重新启动Coturn以重新加载配置。

```
sudo systemctl restart coturn.service
```
创建一个新的突触配置文件。

```
sudo nano /etc/matrix-synapse/conf.d/turn.yaml
```
将以下行添加到配置文件中。将turn_shared_secret值替换为/etc/turnserver.conf中的static-auth-secret值。

```
turn_uris: [ "turn:turn.example.org?transport=udp", "turn:turn.example.org?transport=tcp" ]
turn_shared_secret: 'static-auth-secret'
turn_user_lifetime: 86400000
turn_allow_guests: True
```
重新启动突触以应用新配置。

```
sudo systemctl restart matrix-synapse.service
```
## 7.使用矩阵

Synapse现已配置，您可以将其与任何Matrix客户端一起使用。Element是最受欢迎的矩阵客户端，可作为托管Web应用程序、桌面和移动应用程序使用。

如果您想托管自己的Element实例，请进一步阅读有关如何安装和配置它的说明。

要登录到您的Matrix客户端，请在用户名字段中键入完整的Matrix ID(例如，@bob:example.org)。大多数像Element这样的客户机自动获取主服务器信息。如果不工作，检查/。matrix服务器上的famous /matrix/client/ URL有正确的主服务器信息。如果是，您的客户端不支持主服务器发现，您需要手动插入主服务器地址。

## 8.安装元素

安装jq。

```
sudo apt install jq
```
为Element创建一个目录。

```
sudo mkdir -p /var/www/element
```
创建一个新文件以获取最新的Element版本。

```
sudo nano /var/www/element/update.sh
```
将以下行添加到文件中。
```

#!/bin/sh
set -e

install_location="/var/www/element"
latest="$(curl -s https://api.github.com/repos/vector-im/element-web/releases/latest | jq -r .tag_name)"

cd "$install_location"

[ ! -d "archive" ] && mkdir -p "archive"
[ -d "archive/element-${latest}" ] && rm -r "archive/element-${latest}"
[ -f "archive/element-${latest}.tar.gz" ] && rm "archive/element-${latest}.tar.gz"

wget "https://github.com/vector-im/element-web/releases/download/${latest}/element-${latest}.tar.gz" -P "archive"
tar xf "archive/element-${latest}.tar.gz" -C "archive"

[ -L "${install_location}/current" ] && rm "${install_location}/current"
ln -sf "${install_location}/archive/element-${latest}" "${install_location}/current"
ln -sf "${install_location}/config.json" "${install_location}/current/config.json"
```
将文件标记为可执行文件。

```
sudo chmod +x /var/www/element/update.sh
```
执行文件下载元素。

```
sudo /var/www/element/update.sh
```
要将来更新元素，请重新运行该命令。

9.配置元素

复制示例元素配置。

```
sudo cp /var/www/element/current/config.sample.json /var/www/element/config.json
```
编辑配置文件。

```
sudo nano /var/www/element/config.json
```
将默认的Matrix.org家庭服务器地址更改为您的家庭服务器。
```

"m.homeserver": {
    "base_url": "https://matrix.example.org",
    "server_name": "example.org"
},
```
如果您想在网站标题和其他地方使用自己的名称而不是元素，请更改品牌名称。

```
"brand": "My Example Chat",
```
从Let's Encrypt获取TLS证书。

```
sudo certbot certonly --nginx -d element.example.org
```
创建一个新的Nginx配置文件。

```
sudo nano /etc/nginx/sites-available/element
```
将以下行添加到配置文件中。
```

server {
    listen 80;
    listen [::]:80;

    server_name element.example.org;

    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    server_name element.example.org;

    root /var/www/element/current;
    index index.html;

    add_header Referrer-Policy "strict-origin" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-Frame-Options "SAMEORIGIN" always;

    # TLS configuration
    ssl_certificate /etc/letsencrypt/live/element.example.org/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/element.example.org/privkey.pem;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;
}
```
启用配置。

```
sudo ln -s /etc/nginx/sites-available/element /etc/nginx/sites-enabled
```
重新加载Nginx配置。

```
sudo systemctl reload nginx.service
```
您现在可以从element子域（例如，https://element.example.org）访问Element。要登录，请键入您的用户名或完整的矩阵ID。

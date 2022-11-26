登录:Web服务器的管理员URL（admin/admin）
管理:docker exec -it (whatever your container name is e.g. freepbx) bash
在Dockerfile构建期间为/var/lib/asterisk、/var/spool/asterisk、/home/asterisk和/etc/asterisk创建符号链接。启动时，会复制并生成配置文件以支持可移植性。
为了有效地利用容器，应映射以下目录进行持久存储。
/certs	在这里放上TLS的证书，带PJSIP / UCP / HTTPd / FOP
/var/www/html	FreePBX Web文件
/var/log/	Apache、Asterisk和FreePBX日志文件
/data	Asterisk、FreePBX和FOP的数据持久性
/assets/custom	可选-如果您想覆盖容器中的一些文件，
将它们按照/var/www/html目录下方的相同文件夹结构放置在这里
-
-|_ certs
-|  var
-      | www
-      | log
-|_ data
-|_ assets _ custom


参数
ADMIN_DIRECTORY:访问管理面板的哪个文件夹	/admin
  服务器
    DB_EMBEDDED:允许您使用内部提供的MariaDB服务器，例如TRUE或FALSE	
    DB_HOST:MySQL服务器的主机或容器名称，例如freepbx-db	
    DB_PORT	MySQL端口	3306
    DB_NAME	MySQL数据库名称，例如asterisk	
    DB_USER	上述数据库的MySQL用户名，例如asterisk	
    DB_PASS	上述数据库的MySQL密码，例如password	
  防火墙
    ENABLE_FAIL2BAN	启用Fail2ban阻止“坏人”	TRUE
  flash面板
    ENABLE_FOP	启用闪存运算符面板	FALSE
  SSL
    ENABLE_SSL	启用HTTPd以服务SSL请求	FALSE
ENABLE_XMPP	使用MongoDB启用XMPP模块	FALSE
ENABLE_VM_TRANSCRIBE	使用IBM Watson启用语音信箱转录	FALSE
FOP_DIRECTORY	哪个文件夹可以访问 FOP	/fop
HTTP_PORT	HTTP监听端口	80
HTTPS_PORT	HTTPS 监听端口	443
INSTALL_ADDITIONAL_MODULES	在第一个容器启动时额外安装的逗号分隔模块列表	
RTP_START	启动RTP传输的哪个端口	18000
RTP_FINISH	启动RTP传输的哪个端口	20000
UCP_FIRST	加载UCP作为网页首页TRUE或FALSE	TRUE
TLS_CERT	如果没有反向代理，TLS证书将用于HTTPS的/证书	
TLS_KEY	如果没有反向代理，TLS密钥将输入/HTTPS证书	
WEBROOT	如果您想安装到子文件夹中，请使用这个。示例：/var/www/html/pbx	/var/www/html
VM_TRANSCRIBE_APIKEY	来自Watson的API密钥查看教程	
VM_TRANSCRIBE_MODEL	沃森语音模型-请参阅此处查看列表	en-GB_NarrowbandModel
ADMIN_DIRECTORY 如果WEBROOT被更改或UCP_FIRST=FALSE

如果设置ENABLE_VM_TRANSCRIBE=TRUE，您需要将Freepbx语音信箱设置中的mailcmd更改为/usr/bin/watson-transcription并设置API密钥。

网络开放端口
80	HTTP
443	HTTPS
4445	FOP
4569	IAX
5060	PJSIP
5160	SIP
8001	UCP
8003	UCP SSL
8008	UCP
8009	UCP SSL
18000-20000/udp	RTP端口

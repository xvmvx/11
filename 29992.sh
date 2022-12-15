#！/bin/bash
mv /etc/ssh/sshd_config /etc/ssh/sshd_config.beifen
mv ~/1/sshd_config1 /etc/ssh/sshd_config
systemctl restart sshd.service || service sshd restart
# iptables配置文件位置/etc/sysconfig/iptables
# 添加2222端口规则
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 29992 -j ACCEPT
# 保存规则
service iptables save
# 重启服务
service iptables restart
echo "使用29992端口登录成功后，再执行222.sh"

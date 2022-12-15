#!/bin/bash
rm -rf /etc/ssh/sshd_config
cp ~/1/sshd_config  /etc/ssh/sshd_config
systemctl restart sshd.service || service sshd restart

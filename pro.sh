#!/bin/bash
if [ ! -d "~/1" ]; then
  sudo git clone https://github.com/xvmvx/1.git /root/1
else
  sudo rm -rf ~/1
  sudo git clone https://github.com/xvmvx/1.git /root/1
fi

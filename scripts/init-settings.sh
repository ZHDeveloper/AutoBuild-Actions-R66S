#!/bin/bash
#===============================================
# File name: init-settings.sh
# Description: This script will be executed during the first boot
# Author: SuLingGG
# Blog: https://mlapp.cn
#===============================================

# Set default theme to luci-theme-argon
uci set luci.main.mediaurlbase='/luci-static/argon'
uci commit luci

# uci set network.wan.proto=pppoe
# uci set network.wan.username='0201213572798@163.gd'
# uci set network.wan.password='0201213572798'
# uci commit network

# Disable opkg signature check
sed -i 's/option check_signature/# option check_signature/g' /etc/opkg.conf

# Disable IPV6 ula prefix
# sed -i 's/^[^#].*option ula/#&/' /etc/config/network

# Check file system during boot
# uci set fstab.@global[0].check_fs=1
# uci commit fstab

pip install --upgrade pip

cd /root/chatgpt-on-wechat

pip3 install -r requirements.txt

sh scripts/start.sh

exit 0

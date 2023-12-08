#!/bin/bash
# =================================================================
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# =================================================================

# 添加软件源
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/luci-app-passwall
svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash

# 移除要替换的包
rm -rf feeds/luci/themes/luci-theme-argon

# Argon主题
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon

# 晶晨宝盒
svn export https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
sed -i "s|firmware_repo.*|firmware_repo 'https://github.com/ZHDeveloper/AutoBuild-Actions-R66S'|g" package/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|ARMv8|ARMv8_MINI|g" package/luci-app-amlogic/root/etc/config/amlogic

./scripts/feeds update -a
./scripts/feeds install -a

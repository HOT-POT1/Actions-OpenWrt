#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

#注释pon_userspace的feeds，并拉取onu源码
sed -i '/^src-git pon_userspace/s/^/# /' feeds.conf.default
git clone https://github.com/naoki66/OpenWrt_ONU_CONFIG.git package/OpenWrt_ONU_CONFIG

#添加luci-theme-aurora
git clone https://github.com/eamonxg/luci-theme-aurora.git package/luci-theme-aurora
git clone https://github.com/eamonxg/luci-app-aurora-config.git package/luci-app-aurora-config

#添加luci-app-airoha-npu
git clone https://github.com/luanmuc/luci-app-airoha-npu.git package/luci-app-airoha-npu

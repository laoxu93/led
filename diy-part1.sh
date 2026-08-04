#!/bin/bash
#
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# GitHub: https://github.com/laoxu93/led
#

# -------------------------------------------------------------------
# 1. 引入 PassWall 及其完整的核心依赖包仓库 (解决 dependency 缺失报错)
# -------------------------------------------------------------------
echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main' >> feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main' >> feeds.conf.default

# -------------------------------------------------------------------
# 2. (可选) 引入 OpenClash 源码
# -------------------------------------------------------------------
echo 'src-git openclash https://github.com/vernesong/OpenClash.git;master' >> feeds.conf.default

# -------------------------------------------------------------------
# 3. (可选) 取消默认 feeds 注释或替换镜像
# -------------------------------------------------------------------
# sed -i 's/^#\(.*telephony\)/\1/' feeds.conf.default
# -------------------------------------------------------------------
# 4. 引入 AdGuardHome 与 Lucky 软件源（供 .config 中 luci-app-adguardhome / luci-app-lucky 使用）
# -------------------------------------------------------------------
echo 'src-git adguardhome https://github.com/sirpdboy/luci-app-adguardhome.git;main' >> feeds.conf.default
echo 'src-git lucky https://github.com/gdy666/luci-app-lucky.git;main' >> feeds.conf.default

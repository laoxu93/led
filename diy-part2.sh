#!/bin/bash
#
# Description: OpenWrt DIY script part 2 (After Update feeds)
# GitHub: https://github.com/laoxu93/led
#

# -------------------------------------------------------------------
# 1. 修改默认 LAN 口 IP 地址 (默认 192.168.1.1 -> 192.168.2.1)
# -------------------------------------------------------------------
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# -------------------------------------------------------------------
# 2. 修改默认主机名
# -------------------------------------------------------------------
sed -i 's/OpenWrt/N60PRO-Router/g' package/base-files/files/bin/config_generate

# -------------------------------------------------------------------
# 3. 预装最新版 Argon 主题并替换老版本
# -------------------------------------------------------------------
# 删除源码中可能存在的旧版 argon
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf package/downloads/luci-theme-argon

# 克隆最新版 argon 主题及配置插件
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/downloads/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/downloads/luci-app-argon-config

# 将默认主题修改为 Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# -------------------------------------------------------------------
# 4. 修复/优化系统默认参数 (如：设置默认时区为上海)
# -------------------------------------------------------------------
sed -i "s/'UTC'/'CST-8'/g" package/base-files/files/bin/config_generate
sed -i "/timezone='CST-8'/a \ \ \ \ \ \ \ \ set system.@system[0].zonename='Asia/Shanghai'" package/base-files/files/bin/config_generate

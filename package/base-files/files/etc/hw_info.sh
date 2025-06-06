#!/bin/sh

echo "===== 硬件信息 ====="
echo "设备型号: $(cat /tmp/sysinfo/model)"
echo "CPU架构: $(uname -m)"
echo "CPU型号: $(grep 'model name' /proc/cpuinfo | head -1 | cut -d: -f2 | sed 's/^[ \t]*//')"
echo "CPU核心: $(grep -c '^processor' /proc/cpuinfo)"
echo "内存总量: $(grep 'MemTotal' /proc/meminfo | awk '{print $2/1024 " MB"}')"
echo "闪存大小: $(df -h / | awk 'NR==2{print $2}')"
echo "固件版本: $(cat /etc/openwrt_release | grep 'DISTRIB_DESCRIPTION' | cut -d= -f2 | tr -d '"')"
echo "内核版本: $(uname -r)"
echo "运行时间: $(uptime -p)"
echo "MAC地址: $(cat /sys/class/net/br-lan/address 2>/dev/null || echo 'N/A')"
echo "IP地址: $(ifconfig br-lan | grep 'inet addr' | awk '{print $2}' | cut -d: -f2)"

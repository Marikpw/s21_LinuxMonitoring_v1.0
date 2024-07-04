#!/bin/bash
host=$HOSTNAME
timezone=$(timedatectl | grep zone | awk '{print $3$4$5}')
User=$(whoami)
Os=$(cat /etc/issue | awk '{print $1$2}')
date=$(date "+%d %b %Y %H:%M:%S")
uptime=$(uptime -p)
uptime_sec=$(uptime | awk '{print$1}' /proc/uptime)

ip=$(hostname -i | awk '{print $1}')
mask=$(ifconfig | grep -m1 inet | awk '{print $4}')
gateway=$(ip -4 route show default | awk '{print $3}')
ram_total=$(grep MemTotal /proc/meminfo | awk '{printf "%.3f GB", $2/(1024*1024)}')
ram_used=$(free --mega | grep Mem: | awk '{printf("%.3f Gb\n", $3/1024)}')

ram_free=$(free --mega | grep Mem: | awk '{printf("%.3f Gb\n", $4/1024)}')
space_root=$(df -lBK | grep /$ | awk '{printf("%.2f Mb\n", $2/1024)}')
space_root_used=$(df -lBK | grep /$ | awk '{printf("%.2f Mb\n", $3/1024)}')
space_root_free=$(df -lBK | grep /$ | awk '{printf("%.2f Mb\n", $4/1024)}')

echo "HOSTNAME = $host"
echo "TIME ZONE = $timezone"
echo "USER = $User"
echo "OS = $Os"
echo "DATE = $date"
echo "UPTIME = $uptime"
echo "UPTIME_SEC = $uptime_sec"
echo "IP = $ip"
echo "MASK = $mask"
echo "GATEWAY = $gateway"
echo "RAM_TOTAL = $ram_total"
echo "RAM_USED = $ram_used"
echo "RAM_FREE = $ram_free"
echo "SPACE_ROOT = $space_root"
echo "SPACE_ROOT_USED = $space_root_used"
echo "SPACE_ROOT_FREE = $space_root_free"

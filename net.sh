#!/bin/bash
# Author: Maria.
# Date & Time: 2016-04-06 10:10:59
# Description: Please Edit here.

seach()
{
    echo ""
    read -p ""
}


read -p "Please input IP/Gateway(eg:192.168.1.1/24): " ipgat
echo $ipgat >test.txt
ip=`awk -F '/' '{print $1}' test.txt`
gat=`awk -F '/' '{print $2}' test.txt`

for((i=0;i<$gat;i++))
do
    gat2=${gat2}"1"
done
for((j=$gat;j<32;j++))
do
    gat2=${gat2}"0"
done

ip10a=`echo $ip|awk -F '.' '{print $1}'`
ip10b=`echo $ip|awk -F '.' '{print $2}'`
ip10c=`echo $ip|awk -F '.' '{print $3}'`
ip10d=`echo $ip|awk -F '.' '{print $4}'`

ip2a=`echo "obase=2;$ip10a"|bc`
for((a=${#ip2a};a<8;a++))
do
    ip2a="0"${ip2a}
done
ip2b=`echo "obase=2;$ip10b"|bc`
for((a=${#ip2b};a<8;a++))
do
    ip2b="0"${ip2b}
done
ip2c=`echo "obase=2;$ip10c"|bc`
for((a=${#ip2c};a<8;a++))
do
    ip2c="0"${ip2c}
done
ip2d=`echo "obase=2;$ip10d"|bc`
for((a=${#ip2d};a<8;a++))
do
    ip2d="0"${ip2d}
done

ip2=${ip2a}${ip2b}${ip2c}${ip2d}
for((i=0;i<32;i++))
do
    ipi=${ip2:$i:1}
    gat2i=${gat2:$i:1}
    if [ "$gat2i" = "1" ]
    then
        ipmis=${ipmis}$ipi
        ipmax=${ipmax}$ipi
    else
        ipmis=${ipmis}"0"
        ipmax=${ipmax}"1"
    fi
done

((ipmisa=2#${ipmis:0:8}))
((ipmisb=2#${ipmis:8:8}))
((ipmisc=2#${ipmis:16:8}))
((ipmisd=2#${ipmis:24:8}))

ipfrist=$[$ipmisd+1]

((ipmaxa=2#${ipmax:0:8}))
((ipmaxb=2#${ipmax:8:8}))
((ipmaxc=2#${ipmax:16:8}))
((ipmaxd=2#${ipmax:24:8}))

ipend=$[$ipmaxd-1]

gat2a=${gat2:0:8}
gat2b=${gat2:8:8}
gat2c=${gat2:16:8}
gat2d=${gat2:24:8}

((gat10a=2#${gat2:0:8}))
((gat10b=2#${gat2:8:8}))
((gat10c=2#${gat2:16:8}))
((gat10d=2#${gat2:24:8}))
pcw=$[32-$gat]
echo "2进制掩码：$gat2a.$gat2b.$gat2c.$gat2d"
echo "10进制掩码：$gat10a.$gat10b.$gat10c.$gat10d"
pcnum=$[2**$pcw-2]
if [ $pcnum  -eq -1 ]
then
    echo "主机数：one host"
    echo "可用地址：$ipmisa.$ipmisb.$ipmisc.$ipmisd"
elif [ $pcnum  -eq 0 ]
then
    echo "主机数：two hosts"
    echo "第一个可用地址：$ipmisa.$ipmisb.$ipmisc.$ipmisd"
    echo "第二个可用地址：$ipmaxa.$ipmaxb.$ipmaxc.$ipmaxd"
else
    echo "主机数：$pcnum"
    echo "子网地址：$ipmisa.$ipmisb.$ipmisc.$ipmisd"
    echo "广播地址：$ipmaxa.$ipmaxb.$ipmaxc.$ipmaxd"
    echo "第一个可用地址：$ipmisa.$ipmisb.$ipmisc.$ipfrist"
    echo "最后一个可用地址：$ipmaxa.$ipmaxb.$ipmaxc.$ipend"
fi

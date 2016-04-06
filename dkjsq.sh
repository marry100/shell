#!/bin/bash
# Author: Maria.
# Date & Time: 2016-03-07 09:04:01
# Description: 贷款计算器.

read -p "请输入贷款总额（单位：万元）：" dkzewy
read -p "请输入贷款年利率（如年利率为6.5%，直接输入6.5）：" dknll
read -p "请输入贷款年限（单位：年）：" dknx
echo "贷款计算方式："
echo "1)等额本金计算法"
echo "2)等额本息计算法"
read -p "请选择贷款方式（1|2）" dkfs
dkze=`echo "scale=2;$dkzewy*10000 " | bc -l`
dkll=`echo "scale=6;$dknll/100 " | bc -l`
dkyll=`echo "scale=6;$dkll/12 " | bc -l`
dkqc=$[$dknx*12]

echo "期次 本月还款额 本月利息 未还款额"
debjjsf()
{
    yhbj=`echo "scale=2;($dkze/$dkqc)/1 " | bc -l`
    whbj=$dkze
    for((i=1;i<=$dkqc;i++))
    do
        bylx=`echo "scale=2;($whbj*$dkyll)/1 " | bc -l`
        bybx=`echo "scale=2;($yhbj+$bylx)/1 " | bc -l`
        yhke=`echo "scale=2;($yhbj*$i)/1 " | bc -l`
        whbj=`echo "$dkze-$yhke " | bc -l`
        if [ $i -eq $dkqc ]
        then
            yhbj=`echo "scale=2;($yhbj+$whbj)/1 " | bc -l`
            whbj="0.00"
            bybx=`echo "scale=2;($yhbj+$bylx)/1 " | bc -l`
        fi
        echo "$i $bybx $bylx $whbj"
    done
}

debxjsf()
{
    bybx=`echo "scale=2;(($dkze*$dkyll*((1+$dkyll)^$dkqc))/(((1+$dkyll)^$dkqc)-1))/1 " | bc -l`
    whbj=$dkze
    for((i=1;i<=$dkqc;i++))
    do
        bylx=`echo "scale=2;($whbj*$dkyll)/1 " | bc -l`
        yhbj=`echo "scale=2;($bybx-$bylx)/1 " | bc -l`
        whbj=`echo "scale=2;($whbj-$yhbj)/1 " | bc -l`
        if [ $i -eq $dkqc ]
        then
            bybx=`echo "scale=2;($yhbj+$whbj)/1 " | bc -l`
            whbj="0.00"
        fi
        echo "$i $bybx $bylx $whbj"
    done
}

case $dkfs in
    1) debjjsf
       ;;
    2) debxjsf
       ;;
    *) exit 1
       ;;
esac


#!/bin/bash
#写一个脚本产生随机3位的数字，并且可以根据用户的输入参数来判断输出几组。 
#执行方法：
#bash  number3.sh  
#直接产生一组3位数字。
#bash number3.sh 10  
#插上10组3位数字。

tem=$1
if [ "$tem" = "" ]
then
    tem = 1;
else
    te=`echo $tem |sed 's/[0-9]//g'`
    if [ "$te" != "" ]
    then
        echo "请填写数字！"
        exit;
    fi
fi

for ((i=1;i<=$tem;i++))
{
    res=$[$RANDOM/1000];
    if [ $res -lt 10 ]
    then
        echo "00"$res;
    elif [ $res -lt 100 ]
    then
        echo "0"$res;
    else
        echo $res;
    fi
}

#!/bin/bash
#写一个脚本，执行后，打印一行提示“Please input a number:"，
#要求用户输入数值，然后打印出该数值，然后再次要求用户输入数值。直到用户输入"end"停止。


while :
do
    read -p "Please input a number:" num;
    numm=`echo $num | sed 's/[0-9]//g'`;
    if [ "$numm" = "end" ]
    then
        echo "Bye!"
        exit 0;
    elif [ "$numm" != "" ]
    then
        echo "Your input is not a number!try again!";
    else
        echo "The number is $num!";
    fi
done




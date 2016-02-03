#!/bin/bash
#脚本可以带参数也可以不带，参数可以有多个，每个参数必须是一个目录，脚本检查参数个数，\
#若等于0，则列出当前目录本身；否则，显示每个参数包含的子目录。

if [ $# -eq 0 ]
then
   /bin/ls -d `pwd`;
else
    for i in $@
    do
        if [ -d $i ]
        then
            /bin/find $i -maxdepth 1 -type d ;
            echo "";
        else
           echo $i "不是目录！";
           echo "";
        fi
     done
fi


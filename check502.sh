#! /bin/bash
#保存几个这两天写的shell脚本
#服务器上跑的是LNMP环境，近期总是有502现象。502为网站访问的状态码，200正常，502错误是nginx最为普通的错误状态码。\
#由于502只是暂时的，并且只要一重启php-fpm服务则502消失，但不重启的话，则会一直持续很长时间。\
#所以有必要写一个监控脚本，监控访问日志的状态码，一旦发生502，则自动重启一下php-fpm。

#我们设定： 
#1. access_log  /data1/log/access.log
#2. 脚本死循环，每10s检测一次
#3. 重启php-fpm的方法是  /etc/init.d/php-fpm restart

log=/data1/log/access.log
N=10

while :; do
    tail -n 100 $log > /tmp/log
    n_502=`grep -c ' 502"' /tmp/log`
    if [ $n_502 -ge $N ]; then
        top -bn1 >/tmp/`date +%H%M%S`-top.log
        vmstat 1 5 >/tmp/`date +%H%M%S`-vm.log
        /etc/init.d/php-fpm restart 2> /dev/null
        sleep 60
    fi
    sleep 10
done


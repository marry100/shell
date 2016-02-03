#!/bin/bash

mysqlre()
{
    echo '重启mysql服务';
    service mysql restart;
}

httpdre()
{
    echo '重启httpd服务';
    service httpd restart;
}

proftpdre()
{
    echo '重启ftp服务';
    service proftpd restart;
}

nginxre()
{
    echo '重启nginx服务';
    service nginx restart;
}

if [[ $1 = mysql ]]
then
    mysqlre 2>/dev/null;
elif [[ $1 = httpd ]]
then
    httpdre 2>/dev/null;
elif [[ $1 = ftp ]]
then
    proftpdre 2>/dev/null;
elif [[ $1 = lamp ]]
then
    httpdre 2>/dev/null;
    mysqlre 2>/dev/null;
elif [[ $1 = nginx ]]
then
    nginxre 2>/dev/null;
else
    while :;
    do
        echo '1：重启httpd服务';
        echo '2：重启mysql服务';
        echo '3：重启ftp服务';
        echo '4：重启LAMP服务';
        echo '5：重启nginx服务';
        echo '6：退出';
        read -p '请选择一个数字：' sel
        case $sel in
        1)
           httpdre 2>/dev/null;;
        2)
           mysqlre 2>/dev/null;;
        3)
           proftpdre 2>/dev/null;;
        4)
           httpdre 2>/dev/null;
           mysqlre 2>/dev/null;;
        5)
           nginxre 2>/dev/null;;
        6)
           exit;;
        *)
           echo "无效参数！";
        esac
    done
fi


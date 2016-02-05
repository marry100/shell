#!/bin/bash
#安装 Shadowsocks代理
#作者 Maria
#时间 2016-1-29
#版本 0.1

#定义 PATH
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
export PATH;

#检查当前用户是否root
if [ $(id -u) != "0" ]
then
    echo "请使用root用户安装Shadowsocks代理！";
    exit 1;
else
    echo "当前用户是root，安装继续……";
fi

read -p "请设置ss的端口server_port（默认8388）：" server_port
if [ "$server_port" = "" ]
then
	server_port=8388;
fi
echo "你设置的ss的端口server_port为$server_port";
    
read -p "请设置ss的密码server_password（默认123456）：" server_password
if [ "$server_password" = "" ]
then
	server_password=123456;
fi
echo "你设置的ss的密码server_password为$server_password";	


apt-get update -y;
apt-get install -y python-setuptools m2crypto supervisor;
easy_install pip;
pip install shadowsocks;

cat >/etc/shadowsocks.json<<EOF
{
    "server":"0.0.0.0",
    "server_port":$server_port,
    "local_port":1080,
    "password":"$server_password",
    "timeout":600,
    "method":"aes-256-cfb"
}
EOF

touch /tmp/Shadowsocks;
cat >/tmp/Shadowsocks<<EOF
[program:shadowsocks]
command=ssserver -c /etc/shadowsocks.json
autostart=true
autorestart=true
user=root
log_stderr=true
logfile=/var/log/shadowsocks.log
EOF

cat /tmp/Shadowsocks >> /etc/supervisord.conf;

service supervisord start;

netstat -lntp;

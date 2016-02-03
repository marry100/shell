
#!/bin/bash
#写一个脚本，检测用户输入字符串的合法性，要求字符串由大小写字母、数字组成，无标点、特殊符号和空格。
sr=$1;

m1=`echo $sr |sed 's/[^A-Z]//g'`;
m2=`echo $sr |sed 's/[^a-z]//g'`;
m3=`echo $sr |sed 's/[^0-9]//g'`;
m4=`echo $sr |sed 's/[A-Za-z0-9]//g'`;

pd(){
N=0
if [ "$m1" = "" ]
then
    echo "输入必须含有大写字母";
    N=1;
fi
if [ "$m2" = "" ]
then
    echo "输入必须含有小写字母";
    N=1;
fi
if [ "$m3" = "" ]
then
    echo "输入必须含有数字";
    N=1;
fi
if [ "$m4" != "" ]
then
    echo "输入不能含有符号";
    N=1;
fi
return $N;
}

pd;
if [ $? -ne 0 ]
then
    echo "输入不合法！";
else
    echo "输入合法！";
fi


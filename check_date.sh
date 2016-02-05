#!/bin/bash
#check date

if [ $# -ne 1 ] || [ ${#1} -ne 8 ]
then
    echo "Usage: bash $0 yyyymmdd";
    exit 1;
fi
datem=$1;
year=${datem:0:4}
month=${datem:4:2}
day=${datem:6:2}

daym=`cal $month $year|grep  "$day"`

if [ "$daym" != "" ]
then 
    echo ok 
else
    echo "Usage: bash $0 yyyymmdd";
    exit 1;
fi

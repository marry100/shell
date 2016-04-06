#!/bin/bash
# Author: Maria.
# Date & Time: 2016-03-25 15:18:05
# Description: Please Edit here.

dayin(){
    for((i=$i;i<=$sz;i++))
    do
        echo -e "$i \c"
    done
    echo
}

i=1

read -p "input a pause num:" sz
dayin

input(){
    read -p "input a pause num:" sz
    dayin
}

while :
do 
    read -p "continue?(y|n)" yes
    if [ "$yes" = "y" ]
    then
        input
    else
        exit 1
    fi
done

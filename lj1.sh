#!/bin/bash
# Author: Maria.
# Date & Time: 2016-02-28 14:39:14
# Description: Please Edit here.
a[1]=1
a[2]=2
i=3
while [ $i -le 100 ]
do
((a[$i]=${a[$i-1]}+${a[$i-2]}))
((i++))
done
echo ${a[100]}

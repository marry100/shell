#!/bin/bash
# Author: Maria.
# Date & Time: 2016-02-28 14:30:05
# Description: Please Edit here.
a=1
b=2
for((i=3;i<=100;i++))
do
   c=$[$a+$b]
   a=$b
   b=$c
done
echo $c

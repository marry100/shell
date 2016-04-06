#!/bin/bash
# Author: Maria.
# Date & Time: 2016-03-01 20:32:17
# Description: Please Edit here.

todir=$1;
if [ -z $todir ]
then
    read -p "input the dir for move to:" todir
fi

if [ ! -d $todir ]
then
    mkdir -p $todir
fi

filelist=`find . -type f -name '*.txt'`

for txtfile in $filelist
do
   mv $txtfile $todir
done

/bin/ls -Slr $todir

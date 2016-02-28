#!/bin/bash
# Author: Maria.
# Date & Time: 2016-02-28 15:42:56
# Description: Please Edit here.
for((i=1;i<=12000;i++))
do 
        for((k=2;k<=i;k++))
        do 
                if [ $k -eq $i ]
                then
                        echo -e "$i \c"
                        break

                fi
                if [ $(($i%k)) -eq 0 ]
                then break
                fi
        done
done

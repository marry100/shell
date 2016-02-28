#!/bin/bash
# Author: Maria.
# Date & Time: 2016-02-05 15:57:57
# Description: Please Edit here.
echo  "please enter three number:"
  read -p "the first number is :" n1
  read -p "the second number is:" n2
  read -p "the third number is:" n3
let MAX=$n1
if [ $n2 -ge $n1 ]; then
    MAX=$n2
fi
if [ $n3 -ge $MAX ]; then
     MAX=$n3
fi
echo "the max number is $MAX."

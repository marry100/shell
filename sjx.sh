#!/bin/bash#打印三角形
for ((i=1;i<=9;i++))
do
j=9
  while (( j > i ))
  do
    echo -n " "
    let j--
  done

  for k in `seq 1 $i`
  do
    echo -n "*"
  done

  l=1
  until (( l >= i ))
  do
    echo -n "*"
    let l++
  done
echo ""
done

#!/bin/bash
#输入工资，判断需要交纳的税
#小于3000的部分不用交税；
#3000-5000的部分，按10%交纳
#5000-8000的部分，按15%交纳
#大于8000的部分，按20%交纳

while :
do
read -p "Input your Pay:" pay
tax=0;
if [ $pay -lt 3000 ]
then
    tax=0;
elif [ $pay -ge 3000 ] && [ $pay -lt 5000 ]
then
    taxm=1;
elif [ $pay -ge 5000 ] && [ $pay -lt 8000 ]
then
    taxm=2;
elif [ $pay -ge 8000 ]
then
    taxm=3;
fi

case $taxm in
1)
    tax=`echo "scale=2; ($pay-3000)*0.1" |bc -l`
    ;;
2)
    tax=`echo "scale=2; (($pay-5000)*0.15)+200" |bc -l`
    ;;
3)
    tax=`echo "scale=2; (($pay-8000)*0.2)+200+450" |bc -l`
    ;;
*)
    echo "Try again!"
    continue
    ;;
esac

echo "You need to pay $tax ."
done


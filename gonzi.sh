#!/bin/bash
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

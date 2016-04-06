#!/usr/bin/python
# Author: Maria.
# Date & Time: 2016-03-25 21:04:28
# Description: Please Edit here.

def dayin(szlist):
    for i in szlist:
        print i;

i=1;

while (1==1):
   sz=raw_input("input a pause num:")
   szlist=range(i,sz,1);
   dayin(szlist);
   yes=raw_input("continue?")
   if(yes=="y"):
       continue;
   else:
       exit ;


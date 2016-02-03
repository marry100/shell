#!/bin/bash
#download youtube video

if [ $# -eq 0 ]
then
    echo "please input YouTuBe Video URL!"
    exit 1;
fi

#wj="/usr/local/bin/youtube-dl"
#cd /root/video;
#if [ ! -f $wj ]
#then
#    wget https://yt-dl.org/downloads/2016.01.29/youtube-dl;
#    mv youtube-dl /usr/local/bin/;
#fi
#chmod +x $wj;

#apt-get update -y;
#apt-get install python-software-properties software-properties-common -y;
#apt-add-repository ppa:mc3man/trusty-media -y;
#apt-get update -y;
#apt-get install ffmpeg gstreamer0.10-ffmpeg -y;

echo "Begin download...";
until [ $# -eq 0 ]
do
youtube-dl -f 137+141 $1
if [ $? -ne 0 ]
then
    youtube-dl -f 22 $1
    if [ $? -ne 0 ]
    then
        youtube-dl -f 18 $1
    fi
fi
shift
done


#!/bin/bash

CDLABEL=`/sbin/blkid /dev/cdrom|awk '{print $3}'`
CDLABEL=${CDLABEL/LABEL=/}
CDLABEL=`echo $CDLABEL| xargs echo`

if [ "$CDLABEL" != "retrocard" ]; then
    if [ "$CDLABEL" != "RETROCARD" ]; then
        exit
    fi
fi

if [ ! -d "/media/retrocard" ]; then
    mkdir /media/retrocard
fi
mount /dev/cdrom /media/retrocard

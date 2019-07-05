#!/bin/sh

TARGETS="192.168.0.0/24"
OPTIONS="-v -T4 -F -sV"
date=`date +%F`
cd /root/scans

nmap $OPTIONS $TARGETS -oA scan-$date > /dev/null

if [ -e scan-prev.xml ]; then
    ndiff scan-prev.xml scan-$date.xml > diff-$date
    echo "*** NDIFF RESULTS ***"
    cat diff-$date
    echo
fi

echo "*** NMAP RESULTS ***"
cat scan-$date.nmap

ln -sf scan-$date.xml scan-prev.xml


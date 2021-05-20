#!/bin/bash

# Ping to stackoverflow to measure latency
ST="www.stackoverflow.com"

# VPN name and avg latency to a temporal file
RES="/tmp/res.txt"
VPNS"/tmp/vpns.txt"

# Ping to get avg latency
ping -c 4 www.stackoverflow.com | tail -1| awk '{print $4}' | cut -d '/' -f 2

# List of VPNs
nmcli con | grep "vpn" | awk '{print $1}' > $VPNS

while read vpn;
do
    echo -n "${vpn}" >> $RES
    nmcli con up id ${vpn}
    ping -c 1 "$ST" | tail -1 | awk '{print $4}' | cut -d '/' -f 2 >> $RES
    nmcli con down id $̣{vpn}
done < $VPNS
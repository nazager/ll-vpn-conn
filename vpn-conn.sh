#!/bin/bash

# Ping to stackoverflow to measure latency
ST="www.stackoverflow.com"

# VPN name and avg latency to a temporal file
RES="/tmp/res.txt"
VPNS="/tmp/vpns.txt"

# List of VPNs
nmcli con | grep "vpn" | awk '{print $1}' > $VPNS

while read vpn;
do
    echo -n "${vpn} " >> $RES
    nmcli con up id ${vpn}
    ping -c 2 "$ST" | tail -1 | awk '{print $4}' | cut -d '/' -f 2 >> $RES
    nmcli con down id ${vpn}
done < $VPNS

# Id of the ll-vpn
final=$(sort -nk 2 $RES | head -1 | awk '{print $2}')

echo ""
echo "Connecting to ${final}"
echo ""

# Finally connect to the minimum latency vpn
nmcli con up id ${final}
echo "Done!"

rm $RES $VPNS
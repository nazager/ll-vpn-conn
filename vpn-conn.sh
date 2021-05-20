#!/bin/bash

# Ping to stackoverflow to measure latency
ST="www.stackoverflow.com"

# VPN name and avg latency to a temporal file
RES="/tmp/res.txt"

# Ping to get avg latency
ping -c 4 www.stackoverflow.com | tail -1| awk '{print $4}' | cut -d '/' -f 2

# List of VPNs
nmcli con | grep "vpn" | awk '{print $1}' > $RES

# Sort by lowest latency
sort -nk 2 $RES

# Id of the ll-vpn
$(sort -nk 2 $RES | head -1 | awk '{print $2}')
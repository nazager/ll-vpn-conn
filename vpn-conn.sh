#!/bin/bash

#Ping to get avg latency
ping -c 4 www.stackoverflow.com | tail -1| awk '{print $4}' | cut -d '/' -f 2

#List of VPNs
nmcli con | grep "vpn" | awk '{print $1}'
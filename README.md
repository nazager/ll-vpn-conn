### The purpose of this script is to connect to the VPN with the lowest latency automatically

#### The time to finish the program varies according to the number of VPNs that are available

### Running:

```
$ chmod +x vpn-conn.sh
$ ./vpn-conn.sh
```

### To run on startup:
```
$ sudo chmod +x vpn-conn.sh
$ crontab -e 
```
#### Add the following line:
@reboot sh /path/to/vpn-conn.sh
#### Save and quit and it's ready.
____
____
____

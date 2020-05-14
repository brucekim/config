# CentOS8
Configure IP address

config. file
* ONBOOT=yes
* BOOTPROTO= static or dhcp or none
* IPADDR=xxx.xxx.xxx.xxx
* PREFIX= subnetting(CIDR)
* NETMASK=xxx.xxx.xxx.xxx
* GATEWAY=xxx.xxx.xxx.xxx
* DNS1=xxx.xxx.xxx.xxx
* DNS2=xxx.xxx.xxx.xxx
'''
/etc/sysconfig/network-scripts/ifcfg-enp0s3

TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=enp0s3
DEVICE=enp0s3
HWADDR=08:00:27:9C:1E:13
ONBOOT=
BOOTPROTO=
IPADDR=
PREFIX=
NETMASK=
GATEWAY=
DNS1=
DNS2=

'''

Apply config. to system
'''
sudo systemctl restart NetworkManager.service

nmcli d  //check network interface
'''

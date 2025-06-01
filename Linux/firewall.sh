#!/bin/sh

iptables -I INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -I OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

iptables -I INPUT -p tcp --dport 22 -j ACCEPT
iptables -I OUTPUT -p tcp --dport 22 -j ACCEPT
iptables -I OUTPUT -p tcp --dport 53 -j ACCEPT
iptables -I OUTPUT -p udp --dport 53 -j ACCEPT

iptables -I INPUT -p icmp -j ACCEPT
iptables -I OUTPUT -p icmp -j ACCEPT

for arg in "$@"; do
  case "$arg" in
    ad)  iptables -I OUTPUT -p tcp -m multiport --dport 389,636,88,464,445,4505:4506,9997 -j ACCEPT;;
    ftp) iptables -I INPUT -p tcp -m multiport --dport 20:21 -j ACCEPT
      iptables -I OUTPUT -p tcp -m multiport --dport 20:21 -j ACCEPT;;
    web) iptables -I OUTPUT -p tcp -m multiport --dport 80,443;;
    ''|*[!0-9]*) echo "$arg is not a valid argument." ;;
    *) iptables -I INPUT -p tcp --dport $arg -j ACCEPT
      iptables -I OUTPUT -p tcp --dport $arg -j ACCEPT;;
  esac
done


iptables -A INPUT -j DROP
iptables -A OUTPUT -j DROP

#!/bin/bash
sudo modprobe nf_conntrack_pptp nf_conntrack_proto_gre
echo "modules"
lsmod | grep nf_conntrack_pptp

echo ""
echo nf_conntrack_helper=$(cat /proc/sys/net/netfilter/nf_conntrack_helper)
sudo sysctl net.netfilter.nf_conntrack_helper=1
echo nf_conntrack_helper=$(cat /proc/sys/net/netfilter/nf_conntrack_helper)
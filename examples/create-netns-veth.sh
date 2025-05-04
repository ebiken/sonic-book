#/usr/bin/bash

ip netns add ns1
ip netns add ns2
ip netns add ns3
ip netns add ns4

ip link add name veth1 type veth peer name veth-br01
ip link add name veth2 type veth peer name veth-br02
ip link add name veth3 type veth peer name veth-br03
ip link add name veth4 type veth peer name veth-br04

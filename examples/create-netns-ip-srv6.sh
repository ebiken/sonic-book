#/usr/bin/bash

# ns1
ip netns add ns1
ip link set vnet1 netns ns1
ip netns exec ns1 ip link set dev lo up
ip netns exec ns1 ethtool --offload vnet1 rx off tx off
ip netns exec ns1 ip addr add 10.0.0.100/24 dev vnet1
ip netns exec ns1 ip addr add 2001:db8::100/64 dev vnet1
ip netns exec ns1 ip link set dev vnet1 up
ip netns exec ns1 ip route add 10.0.0.0/16 via 10.0.0.1

# ns2
ip netns add ns2
ip link set vnet2 netns ns2
ip netns exec ns2 ip link set dev lo up
ip netns exec ns2 ethtool --offload vnet2 rx off tx off
ip netns exec ns2 ip addr add 10.0.4.100/24 dev vnet2
ip netns exec ns2 ip addr add 2001:db8:4::100/64 dev vnet2
ip netns exec ns2 ip link set dev vnet2 up
ip netns exec ns2 ip route add 10.0.0.0/16 via 10.0.4.1

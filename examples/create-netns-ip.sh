#/usr/bin/bash

# ns1: vlan1001, untagged
ip link set veth1 netns ns1
ip netns exec ns1 ip link set dev lo up
ip netns exec ns1 ethtool --offload veth1 rx off tx off
ip netns exec ns1 ip addr add 192.168.1.101/24 dev veth1
ip netns exec ns1 ip link set dev veth1 up
ip netns exec ns1 ip route add default via 192.168.1.1
ip link set veth-br01 master br01 up

# ns2: vlan1001, untagged
ip link set veth2 netns ns2
ip netns exec ns2 ip link set dev lo up
ip netns exec ns2 ethtool --offload veth2 rx off tx off
ip netns exec ns2 ip addr add 192.168.1.102/24 dev veth2
ip netns exec ns2 ip link set dev veth2 up
ip netns exec ns2 ip route add default via 192.168.1.1
ip link set veth-br02 master br02 up

# ns3: vlan1002, untagged
ip link set veth3 netns ns3
ip netns exec ns3 ip link set dev lo up
ip netns exec ns3 ethtool --offload veth3 rx off tx off
ip netns exec ns3 ip addr add 192.168.2.103/24 dev veth3
ip netns exec ns3 ip link set dev veth3 up
ip netns exec ns3 ip route add default via 192.168.2.1
ip link set veth-br03 master br03 up

# ns4: vlan1002, tagged, address assigned to loopback
ip link set veth4 netns ns4
ip netns exec ns4 ip link set dev lo up
ip netns exec ns4 ip addr add 10.0.0.4/32 dev lo
ip netns exec ns4 ethtool --offload veth4 rx off tx off
ip netns exec ns4 ip link add link veth4 name veth4.1002 type vlan id 1002
ip netns exec ns4 ip addr add 192.168.2.104/24 dev veth4.1002
ip netns exec ns4 ip link set dev veth4 up
ip netns exec ns4 ip route add default via 192.168.2.1
ip link set veth-br04 master br04 up
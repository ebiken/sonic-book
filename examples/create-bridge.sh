#/usr/bin/bash

ip link add br01 type bridge
ip link add br02 type bridge
ip link add br03 type bridge
ip link add br04 type bridge
ip link set br01 up
ip link set br02 up
ip link set br03 up
ip link set br04 up
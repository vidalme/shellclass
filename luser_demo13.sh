#!/bin/bash

#This script show the open network ports on a system.
# Use -4 as an argument to limi to tcpv4 ports.

ss -nutl ${1} | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}'

#!/bin/bash

# Vagrantfile path
VAGRANTFILE="tools/configure_environment.rb"

# Extract values using grep and awk
NUM_NODES=$(grep -m1 'NUM_NODES' "$VAGRANTFILE" | awk -F '=' '{print $2}' | tr -d ' ')
NUM_CONTROLLER_NODE=$(grep -m1 'NUM_CONTROLLER_NODE' "$VAGRANTFILE" | awk -F '=' '{print $2}' | tr -d ' ')
IP_NTW=$(grep -m1 'IP_NTW' "$VAGRANTFILE" | awk -F '"' '{print $2}')
CONTROLLER_IP_START=$(grep -m1 'CONTROLLER_IP_START' "$VAGRANTFILE" | awk -F '=' '{print $2}' | tr -d ' ')
NODE_IP_START=$(grep -m1 'NODE_IP_START' "$VAGRANTFILE" | awk -F '=' '{print $2}' | tr -d ' ')


# Generate hosts file content
hosts="127.0.0.1 localhost\n"

# Generate entries for nodes
for ((i = 1; i <= NUM_NODES; i++)); do
    hostname="node0$i"
    ip_address="${IP_NTW}$((CONTROLLER_IP_START + i))"
    hosts+="\n${ip_address} ${hostname}"
done

# Generate entry for controller node
controller_ip="${IP_NTW}${CONTROLLER_IP_START}"
hosts+="\n${controller_ip} edge"

# Write to hosts file
echo -e "$hosts" > hosts

echo "Hosts file generated successfully."

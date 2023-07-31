#!/bin/bash

# Define the network range to sweep (adjust as needed)
network="192.168.0."

# Function to check the reachability of an IP address
function ping_ip() {
    ping -c 1 -W 1 "$1" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "Host $1 is reachable."
    else
        echo "Host $1 is unreachable."
    fi
}

# Main IP sweeping loop
for ((i=1; i<=254; i++)); do
    ip="${network}${i}"
    ping_ip "$ip"
done

#!/bin/bash

set -e

echo "Starting SOCKS proxy..."

while true; do
    echo "Attempting to connect SOCKS proxy..."
    
    # Add ConnectTimeout, ServerAliveInterval, ServerAliveCountMax, and disable TCPKeepAlive
    sshpass -p "$SSH_PASSWORD" ssh -o StrictHostKeyChecking=no \
        -o ConnectTimeout=10 \
        -o ServerAliveInterval=10 \
        -o ServerAliveCountMax=3 \
        -o TCPKeepAlive=no \  # Disable TCP-level keepalive
        -D 0.0.0.0:1080 -q -C -N "$SSH_USER@$SSH_HOST"
    
    # If ssh fails, wait and retry
    echo "Connection lost, retrying in 5 seconds..."
    sleep 5
done

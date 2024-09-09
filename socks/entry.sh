#!/bin/bash

set -e

# TODO: Add health check to vpn container and add dependency on it or use sock5 server
echo "Waiting for OpenFortiVPN to start..."
sleep 10

echo "Starting SOCKS proxy..."
sshpass -p "$SSH_PASSWORD" ssh -o StrictHostKeyChecking=no -D 0.0.0.0:1080 -q -C -N "$SSH_USER@$SSH_HOST"
#!/bin/bash

set -e

echo "Starting SOCKS proxy..."

sshpass -p "$SSH_PASSWORD" ssh -o StrictHostKeyChecking=no -D 0.0.0.0:1080 -q -C -N "$SSH_USER@$SSH_HOST"
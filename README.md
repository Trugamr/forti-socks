# forti-socks

Docker Compose setup to run FortiClient VPN and expose a SOCKS5 proxy for secure network access.

## Purpose
This setup allows you to use the FortiClient VPN inside a Docker container, providing secure VPN access. A sidecar container runs alongside it to create a SOCKS5 proxy using SSH, allowing traffic to flow through the VPN and a remote host.

### Why use a separate SOCKS proxy container?
In my particular use case, with VPN I had access to a remote server which then has access to other servers that I needed to access. This is why we don't run a simple SOCKS proxy and instead use a separate container to create a SOCKS SSH proxy involving a remote server.

### Can I use this without using a remote server to act as a SOCKS proxy?
Yes, you can add a second container that just runs a SOCKS server like [dante](https://www.inet.no/dante/) which would then allow you to use VPN as a SOCKS proxy.

## Usage
1. Create an [openfortivpn](https://github.com/adrienverge/openfortivpn) configuration file and place it in the `openfortivpn/config` directory.
2. Create a `.env` file with the following environment variables:
    - `SSH_HOST`: The hostname or IP address of the remote server for the SOCKS5 proxy.
    - `SSH_USER`: The SSH login username for the remote server.
    - `SSH_PASSWORD`: The SSH login password for the remote server.

## Default SOCKS Proxy
By default, this setup now uses the `docker-socks-tunnel` image from [httptoolkit/docker-socks-tunnel](https://github.com/httptoolkit/docker-socks-tunnel) to create the SOCKS5 proxy. This change simplifies setup and removes the need for a custom-built container for SOCKS proxy functionality.

If you prefer to use a custom SOCKS setup (e.g., using Dante), you can uncomment the `socks` service in the `docker-compose.yml` file and comment out or remove the `socks-tunnel` service.

## Stability
This setup is intended for occasional use and is not production-ready. It works reliably for personal or testing purposes, but further improvements would be needed for production environments.

## Additional Resources
- [openfortivpn](https://github.com/adrienverge/openfortivpn)
- [Netch](https://github.com/netchx/netch)
- [SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega)

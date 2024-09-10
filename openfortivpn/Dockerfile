FROM debian:12.7

# Install required packages
RUN apt-get update && apt-get install -y \
  openfortivpn \
  iproute2

HEALTHCHECK --interval=10s --timeout=5s --start-period=5s --retries=3 \
  CMD ip link show ppp0 | grep -q "UP" || exit 1

ENTRYPOINT [ "openfortivpn" ]
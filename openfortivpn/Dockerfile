FROM debian:12.7

# Install required packages
RUN apt-get update && apt-get install -y \
  openfortivpn

ENTRYPOINT [ "openfortivpn" ]
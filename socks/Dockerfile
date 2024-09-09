FROM debian:12.7

RUN apt update && apt install -y \
  openssh-client \
  sshpass

WORKDIR /app

COPY ./entry.sh ./

ENTRYPOINT [ "./entry.sh" ]

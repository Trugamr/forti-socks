FROM debian:12.7-slim

RUN apt update && apt install -y \
  openssh-client \
  sshpass

WORKDIR /app

COPY ./start.sh ./

CMD [ "./start.sh" ]

FROM debian:12.7

RUN apt update && apt install -y \
  openssh-client \
  sshpass

WORKDIR /app

COPY ./start.sh ./

CMD [ "./start.sh" ]

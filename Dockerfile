FROM ubuntu:18.04

WORKDIR /opt
VOLUME /opt/coin
# Node, Wallet Owner
EXPOSE 3413 13420

RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/mimblewimble/grin/releases/download/v1.0.0/grin-v1.0.0-479973573-linux-amd64.tgz -O - | tar xzf -

RUN rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh ./grin-server.toml ./grin-wallet.toml /opt/
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
FROM frolvlad/alpine-glibc

ENV BITCOIN_CASH_VERSION=0.19.4

RUN apk add --no-cache --virtual build-dependencies --update wget curl ca-certificates
RUN wget -P /tmp https://download.bitcoinabc.org/${BITCOIN_CASH_VERSION}/linux/bitcoin-abc-${BITCOIN_CASH_VERSION}-x86_64-linux-gnu.tar.gz
RUN tar -xzvf /tmp/bitcoin-abc-${BITCOIN_CASH_VERSION}-x86_64-linux-gnu.tar.gz && mv /bitcoin-abc-${BITCOIN_CASH_VERSION} /bitcoin-abc
RUN chmod +x /bitcoin-abc/bin/*
RUN apk del build-dependencies
RUN rm -rf /tmp/*

WORKDIR /bitcoin-abc

EXPOSE 8332
EXPOSE 18332

ENTRYPOINT [ "/bitcoin-abc/bin/bitcoind" ]

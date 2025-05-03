FROM ubuntu:24.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y emacs-mozc-bin && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER ubuntu

RUN mkdir /home/ubuntu/.mozc

CMD ["mozc_emacs_helper"]

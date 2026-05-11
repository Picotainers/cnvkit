FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/etal/cnvkit.git /opt/cnvkit && \
    pip3 install --no-cache-dir /opt/cnvkit && \
    rm -rf /opt/cnvkit

WORKDIR /data
ENTRYPOINT ["cnvkit.py"]

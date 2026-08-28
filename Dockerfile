FROM ubuntu:22.04 AS builder

ARG CNVKIT_REF=v0.9.14

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    git \
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-venv \
    python3-wheel \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:${PATH}"

RUN git clone --depth 1 --branch "${CNVKIT_REF}" https://github.com/etal/cnvkit.git /opt/cnvkit \
    && pip install --no-cache-dir --upgrade pip setuptools wheel \
    && pip install --no-cache-dir /opt/cnvkit

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    python3 \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:${PATH}"

WORKDIR /data
ENTRYPOINT ["cnvkit.py"]

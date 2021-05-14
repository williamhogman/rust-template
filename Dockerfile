FROM rust:1.52 as builder
WORKDIR /usr/src/app
RUN rustup component add rustfmt
COPY . .
RUN cargo install --bin app --path .

FROM debian:buster-slim

RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

RUN GRPC_HEALTH_PROBE_VERSION=v0.3.1 && \
    wget -qO /bin/grpc_health_probe https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/${GRPC_HEALTH_PROBE_VERSION}/grpc_health_probe-linux-amd64 && \
    chmod +x /bin/grpc_health_probe

COPY --from=builder /usr/local/cargo/bin/app /usr/local/bin/app
CMD ["app"]

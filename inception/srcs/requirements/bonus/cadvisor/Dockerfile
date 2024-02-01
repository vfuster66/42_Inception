FROM debian:buster

RUN apt update -y
RUN apt install wget -y && wget https://github.com/google/cadvisor/releases/download/v0.47.2/cadvisor-v0.47.2-linux-arm64 \
    && chmod +x cadvisor-v0.47.2-linux-arm64

CMD ["./cadvisor-v0.47.2-linux-arm64"]
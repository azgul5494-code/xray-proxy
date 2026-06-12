FROM ubuntu:22.04
RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN wget -q https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip Xray-linux-64.zip && \
    chmod +x xray
COPY config.json /app/config.json
EXPOSE 8080
CMD ["./xray", "-c", "config.json"]

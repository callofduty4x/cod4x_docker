# Compile source code
FROM ubuntu
WORKDIR /build_src
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y lib32stdc++6 gcc make nasm:i386 build-essential gcc-multilib g++-multilib git
# Compile server with latest git master version
RUN git clone https://github.com/callofduty4x/CoD4x_Server.git /build_src
RUN make -j

# Build Docker image with a smaller OS image
FROM debian:stable-slim
RUN mkdir -pv /server/{zone,main}
COPY --from=0 /build_src/bin/cod4x18_dedrun /server
RUN chmod +x /server/cod4x18_dedrun
RUN dpkg --add-architecture i386; \
    apt update; apt install -y lib32stdc++6

EXPOSE 28960/tcp
EXPOSE 28960/udp

WORKDIR /server
COPY entrypoint.sh entrypoint.sh
COPY server.cfg server.cfg
RUN chmod +x entrypoint.sh
ENTRYPOINT ./entrypoint.sh
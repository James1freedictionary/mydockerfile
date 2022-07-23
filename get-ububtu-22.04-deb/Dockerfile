FROM ubuntu:22.04
RUN apt update && apt install wget
WORKDIR /root
RUN mkdir build-essential && apt-get download $(apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances build-essential | grep "^\w" | sort -u)
RUN mkdir htop && apt-get download $(apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances htop | grep "^\w" | sort -u)
RUN mkdir neofetch && apt-get download $(apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances neofetch | grep "^\w" | sort -u)
RUN mkdir libncurses-dev && apt-get download $(apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances libncurses-dev | grep "^\w" | sort -u) 
RUN mkdir docker && wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/containerd.io_1.6.6-1_amd64.deb https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce-cli_20.10.17~3-0~ubuntu-jammy_amd64.deb https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce-rootless-extras_20.10.17~3-0~ubuntu-jammy_amd64.deb https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce_20.10.17~3-0~ubuntu-jammy_amd64.deb https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-compose-plugin_2.6.0~ubuntu-jammy_amd64.deb https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-scan-plugin_0.17.0~ubuntu-jammy_amd64.deb
RUN mkdir git && apt-get download $(apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances git | grep "^\w" | sort -u)


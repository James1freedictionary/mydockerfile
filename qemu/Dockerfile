FROM ubuntu:20.04
RUN apt update 
WORKDIR /qemu
RUN apt-get download $(apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances qemu-system-gui qemu-kvm qemu-utils | grep "^\w" | sort -u)
RUN apt install curl tar xz-utils -y && cd .. && tar cvJf qemu.txz qemu
CMD sh

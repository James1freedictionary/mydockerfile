FROM ubuntu:20.04
RUN apt update 
WORKDIR /libncurses-dev
RUN apt-get download $(apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances libncurses-dev | grep "^\w" | sort -u)
RUN apt install curl tar -y && cd .. && tar cvzf libncurses-dev.tgz libncurses-dev
CMD sh

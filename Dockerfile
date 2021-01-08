FROM ubuntu:20.04
LABEL maintainer="Domingo Ruiz Arroyo <ordenadordomi@gmail.com>"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y virt-viewer x11-apps && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 remoteviewer && useradd -m -u 1000 -g 1000 remoteviewer

COPY script_start /usr/bin/
RUN chmod +x /usr/bin/script_start

CMD ["script_start"] 

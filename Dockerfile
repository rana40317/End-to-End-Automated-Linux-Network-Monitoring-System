FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y \
    bash \
    iputils-ping \ 
    netcat-openbsd \
    gawk \
    grep

WORKDIR /app

COPY network_monitor.sh .
COPY network_monitor.csv .

RUN chmod +x network_monitor.sh

CMD ["./network_monitor.sh"]

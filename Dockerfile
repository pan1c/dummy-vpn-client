FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y iproute2 pptp-linux less iputils-ping traceroute mtr wget curl
COPY entry.sh /bin/entry.sh
CMD /bin/entry.sh


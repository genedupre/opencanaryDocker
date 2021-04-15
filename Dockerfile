FROM amd64/ubuntu:18.04
MAINTAINER Trigat https://github.com/trigat/dockeropencanary

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# libpcap-dev is for scapy/pcapy
RUN apt-get update && apt-get install -y sudo python-pip libpcap-dev python3 python3-pip

# use this if you want to use RDP for honeypot
#RUN pip install rdpy

RUN pip install opencanary

# use this if you want to use SNMP for e-mail alerts
RUN pip install scapy pcapy

RUN opencanaryd --copyconfig

COPY ./conf/opencanary.conf /root/.opencanary.conf

ENTRYPOINT opencanaryd --start && /bin/bash

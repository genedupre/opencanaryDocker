FROM amd64/ubuntu:18.04

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -y sudo python-pip libpcap-dev python3 python3-pip

#RUN pip install rdpy

RUN pip install opencanary

RUN pip install scapy pcapy

RUN opencanaryd --copyconfig

COPY ./conf/opencanary.conf /root/.opencanary.conf

VOLUME /var/tmp/

ENTRYPOINT opencanaryd --start && /bin/bash

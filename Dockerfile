FROM ubuntu:14.04
MAINTAINER Erik Dasque

RUN apt-get update
RUN apt-get -y -q install curl

RUN apt-get update
RUN apt-get -y -q install net-tools ethtool inetutils-ping git wget redis-server g++ gcc build-essential libglib2.0 libxml2-dev libpcap-dev librrd-dev redis-server libsqlite3-dev zip unzip bison flex libglib2.0 libxml2-dev libpcap-dev rrdtool librrd-dev autoconf automake autogen redis-server wget libsqlite3-dev libhiredis-dev libgeoip-dev libpango1.0-dev libcairo2-dev libpng12-dev libmysqlclient-dev libnetfilter-queue-dev libmysqlclient-dev zlib1g-dev libzmq3-dev libssl-dev libcurl4-gnutls-dev less vim screen curl supervisor 
RUN apt-get -y -q install libcurl3 logrotate
RUN apt-get -y -q install bridge-utils libzmq3-dev librdkafka1 libmysqlclient-dev libtool
RUN apt-get -y -q install libtool libnetfilter-conntrack3 libnuma1
RUN apt-get -y -q install dkms
# RUN curl -s --remote-name http://packages.ntop.org/apt/14.04/all/apt-ntop.deb
# RUN curl -s --remote-name http://packages.ntop.org/debian/jessie/x64/ntopng/ntopng_3.1.171022-3612_amd64.deb
# 
RUN curl -s --remote-name  http://packages.ntop.org/ubuntu/14.04/all/PF_RING-dkms/pfring-dkms_7.1.0_all.deb
RUN dpkg -i pfring-dkms_7.1.0_all.deb

RUN curl -s --remote-name http://packages.ntop.org/apt/14.04/x64/pfring_7.1.0-1506_amd64.deb
RUN dpkg -i pfring_7.1.0-1506_amd64.deb

RUN curl -s --remote-name http://packages.ntop.org/apt/14.04/x64/ntopng_3.1.171022-3612_amd64.deb

RUN mv ntopng_3.1.171022-3612_amd64.deb apt-ntop.deb
RUN dpkg -i apt-ntop.deb
RUN rm -rf apt-ntop.deb

RUN apt-get -y -q install ntopng redis-server libpcap0.8 libmysqlclient18

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3000

RUN echo '#!/bin/bash\n/etc/init.d/redis-server start\nntopng "$@"' > /tmp/run.sh
RUN chmod +x /tmp/run.sh

ENTRYPOINT ["/tmp/run.sh"]

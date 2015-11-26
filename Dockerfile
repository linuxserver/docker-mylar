FROM linuxserver/baseimage.python

MAINTAINER Sparklyballs <sparklyballs@linuxserver.io>

ENV APTLIST="python2.7"

# install packages
RUN add-apt-repository ppa:fkrull/deadsnakes-python2.7 && \
apt-get install $APTLIST -qy && \
pip install -U configparser && \
pip install -U comictagger && \
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run && chmod -v +x /etc/my_init.d/*.sh && \

# give abc a home folder, needed for comictagger prefs.
usermod -d /config abc

# Volumes and Ports
VOLUME /config /downloads /comics
EXPOSE 8090

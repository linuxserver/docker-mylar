FROM linuxserver/baseimage.python
MAINTAINER Your Name <your@email.com>

RUN pip install -U configparser && \
pip install -U comictagger && \
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
ADD defaults/ /defaults/
RUN chmod -v +x /etc/service/*/run && chmod -v +x /etc/my_init.d/*.sh

# Volumes and Ports
VOLUME /config /downloads /comics
EXPOSE 8090

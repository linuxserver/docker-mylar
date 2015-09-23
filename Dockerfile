FROM linuxserver/baseimage
MAINTAINER Your Name <your@email.com>
ENV APTLIST="python git-core python-openssl"

RUN apt-get update -q && \
apt-get install -y $APTLIST && \
curl -s https://bootstrap.pypa.io/get-pip.py | python - && \
pip install -U comictagger && \
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*


#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
ADD cron/ /etc/cron.d/
ADD defaults/ /defaults/
RUN chmod -v +x /etc/service/*/run && chmod -v +x /etc/my_init.d/*.sh


# Volumes and Ports
VOLUME /config /downloads /comics
EXPOSE 8090

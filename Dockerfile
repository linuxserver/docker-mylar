FROM lsiobase/alpine.python
MAINTAINER sparklyballs

# install pip packages
RUN \
 pip install --no-cache-dir -U \
	comictagger \
	configparser && \

# cleanup
 rm -rf \
	/root/.cache \
	/tmp/*

# add local files
COPY root/ /

# ports and volumes
VOLUME /config /comics /downloads
EXPOSE 8090

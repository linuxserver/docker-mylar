FROM lsiobase/alpine.python
MAINTAINER sparklyballs

# install pip packages
RUN \
 pip install --no-cache-dir -U \
	comictagger \
	configparser && \

# cleanup
 rm -rfv \
	/root/.cache \
	/tmp/* \
	/var/cache/apk/*

# add local files
COPY root/ /

# ports and volumes
VOLUME /config /comics /downloads
EXPOSE 8090

FROM lsiobase/alpine.python:3.8

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sparklyballs"

RUN \
 echo "**** install pip packages ****" && \
 pip install --no-cache-dir -U \
	comictagger \
	configparser \
	html5lib \
	requests \
	tzlocal && \
 echo "**** install app ****" && \
 git clone --depth 1 https://github.com/evilhero/mylar.git /app/mylar && \
 echo "**** cleanup ****" && \
 rm -rf \
	/root/.cache \
	/tmp/*

# add local files
COPY root/ /

# ports and volumes
VOLUME /config /comics /downloads
EXPOSE 8090

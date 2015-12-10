#!/bin/bash
mkdir -p /config/{mylar,scripts}

[[ ! -d /app/mylar/.git ]] && git clone https://github.com/evilhero/mylar.git /app/mylar
[[ ! -d /config/scripts/sabnzbd ]] && cp -pr /app/mylar/post-processing/* /config/scripts/

cd /app/mylar
git pull

chown -R abc:abc /app /config


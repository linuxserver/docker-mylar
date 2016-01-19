#!/bin/bash
mkdir -p /config/{mylar,scripts}

[[ ! -d /config/scripts/sabnzbd ]] && cp -pr /app/mylar/post-processing/* /config/scripts/
[[ ! -d /app/mylar/.git ]] && (git clone https://github.com/evilhero/mylar.git /app/mylar && \
chown -R abc:abc /app /config)


# opt out for autoupdates
[ "$ADVANCED_DISABLEUPDATES" ] && exit 0

cd /app/mylar
git pull
chown -R abc:abc /app


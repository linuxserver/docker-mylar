![http://linuxserver.io](http://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](https://www.linuxserver.io/) team brings you another quality container release featuring auto-update on startup, easy user mapping and community support. Be sure to checkout our [forums](https://forum.linuxserver.io/index.php) or for real-time support our [IRC](https://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`.

# linuxserver/mylar

An automated Comic Book downloader (cbr/cbz) for use with SABnzbd, NZBGet and torrents. [mylar](https://github.com/evilhero/mylar)

## Usage

```
docker create --name=mylar -v /etc/localtime:/etc/localtime:ro -v <path to data>:/config -e PGID=<gid> -e PUID=<uid>  -p 8090:8090 linuxserver/mylar
```

**Parameters**

* `-p 8090` - the port(s)
* `-v /etc/localhost` for timesync - *optional*
* `-v /config` - where mylar should store config files
* `-v /downloads` - map to your downloads folder
* `-v /comics` - map to your comics folder
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation

It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do `docker exec -it mylar /bin/bash`.

### User / Group Identifiers

**TL;DR** - The `PGID` and `PUID` values set the user / group you'd like your container to 'run as' to the host OS. This can be a user you've created or even root (not recommended).

Part of what makes our containers work so well is by allowing you to specify your own `PUID` and `PGID`. This avoids nasty permissions errors with relation to data volumes (`-v` flags). When an application is installed on the host OS it is normally added to the common group called users, Docker apps due to the nature of the technology can't be added to this group. So we added this feature to let you easily choose when running your containers.

## Setting up the application 

The web ui for settings etc, is on :8090.
For more detailed setup refer [mylar](https://github.com/evilhero/mylar).


## Updates

* Upgrade to the latest version simply `docker restart mylar`.
* To monitor the logs of the container in realtime `docker logs -f mylar`.



## Versions

+ **dd.MM.yyyy:** Initial Release. 


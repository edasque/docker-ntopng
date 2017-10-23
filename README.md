# ntopng-docker

This was initially created to run ntopng 3.x on docker on a Synology NAS. Would work in other context, obviously.

## ChangeLog
* 10/23/17: Initial release
* 10/23/17: Removed additional packages that weren't actual dependencies. Updated to ntopng 3.1.171023-3615

## Install & Run
```
docker run --net=host -t -p 3000:3000 edasque/docker-ntopng <ntopng arguments>
```
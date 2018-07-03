# ntopng-docker

This was initially created to run ntopng 3.x on docker on a Synology NAS. Would
work in other context, obviously.

## ChangeLog

* 10/23/17: Initial release
* 10/23/17: Removed additional packages that weren't actual dependencies.
  Updated to ntopng 3.1.171023-3615
* 10/24/17: Updated to ntopng 3.1.171024-3619
* 12/21/17: Updated to ntopng 3.3.171221-3938
* 07/03/18: Updated to ntopng 3.5.180703-4601
## Install & Run

```
docker run --net=host -t -p 3000:3000 edasque/docker-ntopng <ntopng arguments>
```

## Build

```
docker build -t edasque/docker-ntopng .
```

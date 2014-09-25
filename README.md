
## Webvirtmgr Dockerfile

This repository contains **Dockerfile** of [Webvirtmgr](https://github.com/retspen/webvirtmgr).

### Installation

1. Install [Docker](https://www.docker.com/).

2. Pull the image from Docker Hub

```
$ docker pull lemonlatte/docker-webvirtmgr
```

### Usage

```
$ docker run -d -p 8080:8080 lemonlatte/docker-webvirtmgr
```

It may takes 2 or 3 seconds for setting up Django database.

### Mount a Volume

You need to add a directory with its owner id "33".

```
mkdir /path/to/our/volume:/var/local/webvirtmgr
chown 33 /path/to/our/volume:/var/local/webvirtmgr
```

Then, you can mount this folder into your container.

``` 
$ docker run -d -p 8080:8080 -v /path/to/our/volume:/var/local/webvirtmgr lemonlatte/docker-webvirtmgr
```


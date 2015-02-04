# openi-docker-dev

openi-docker-dev provides the OPENi development environment in a single 
docker image. 

## Getting started

### Installing Docker

Docker must be installed to use openi-docker.
Installation can be done through aptitude as follows:

```bash
apt-get install docker.io
```

However due to docker using features specific to linux, for both Windows and OSX the program Boot2Docker must be installed.
Links to these are below: 
- [OSX](https://github.com/boot2docker/osx-installer/releases/tag/v1.4.1)
- [Windows](https://github.com/boot2docker/windows-installer/releases/tag/v1.4.1)

Installation guides for other OS's may be found [here](https://docs.docker.com/installation/)


### Using openi-docker-dev

openi-docker-dev has two ways of being used:

#### Git

First pull or clone the project

```bash
git clone https://github.com/OPENi-ict/openi-docker-dev.git
```

Then build the docker image

```bash
cd openi-docker-dev
docker build -t openiicteu/dev .
```

#### Docker Hub

First pull the project, there are two versions
openiicteu/dev:flat   ~800MB
openiicteu/dev:latest ~1GB

```bash
docker pull openiicteu/dev:<your version>
```

### Running

The following command runs the image as a container

```bash
docker run -i -t --name openidev -p 80:80 -p 443:443 openiicteu/dev bash
```

This will open the container with a bash terminal,
from this you must call the script run_platform.sh

```bash
sh run_platform.sh
```

You can detach from the container with Ctrl+P+Q
You can reattach to the container with

```bash
docker exec -i -t openidev bash
```


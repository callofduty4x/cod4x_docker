# Building and running CoD4X server on Docker
## Build process
In order to build the image:

` docker build -t cod4x /path/to/repo/Docker`
` docker build -t cod4x .` (From this location)
` docker build -t cod4x Docker` (From the repo's root directory)

## Running:
In order to run an instance of CoD4X, zones (maps) must be mounted onto the container via Docker volumes.

Port 28960 in the container must be forwarded to port (bot TCP and UDP) on the host machine. For demonstration purposes, the port used in the host is 28961.

Run command:

```
docker run \
--name 'cod4x' \
-v /path/to/zone/files:/server/zone \
-v /path/to/server.cfg:/server/server.cfg \
-p 28961:28960/tcp \
-p 28961:28960/udp \
-it \
cod4x/bleeding
```

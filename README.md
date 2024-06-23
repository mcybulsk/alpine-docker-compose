# alpine-docker-compose
Docker image built on Alpine but containing fresh Docker and Docker Compose plugin versions

## Usage
Simply reference the Docker image: `ghcr.io/mcybulsk/alpine-docker-compose:latest`

### Example
```shell
docker run --rm -ti ghcr.io/mcybulsk/alpine-docker-compose:latest sh

docker -v
docker compose version

exit
```
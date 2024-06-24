# alpine-docker-compose
Docker image built on Alpine but containing fresh Docker and Docker Compose plugin versions

## Usage
Simply reference the Docker image: `ghcr.io/mcybulsk/alpine-docker-compose:latest`

### Example
```shell
➜  ~ docker run --rm -ti ghcr.io/mcybulsk/alpine-docker-compose:latest sh
/ # docker -v
Docker version 26.1.4, build 5650f9b
/ # docker compose version
Docker Compose version v2.28.1
/ # exit
➜  ~ 
```

### More practical example
In a super simple homelab setup, following can be used for a simple auto-deployment of a `docker-compose.yml` on the same machine where Drone CI is running.
- `.drone.yml` contents:
```yml
kind: pipeline
type: docker
name: main-pipeline

steps:
  - name: docker-up-all
    image: ghcr.io/mcybulsk/alpine-docker-compose:latest
    volumes:
      - name: dockersock
        path: /var/run/docker.sock
    commands:
      - docker compose up -d
    when:
      branch:
        - main

volumes:
  - name: dockersock
    host:
      path: /var/run/docker.sock
```

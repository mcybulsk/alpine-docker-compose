FROM alpine:3.19

ENV DOCKER_VERSION=23.0.0
ENV DOCKER_COMPOSE_VERSION=2.25.0

ENV DOCKER_BIN="$PWD/docker"
ENV PATH="$PATH:$DOCKER_BIN"
ENV DOCKER_CONFIG="${DOCKER_CONFIG:-$HOME/.docker}"

RUN apk add curl
RUN curl -o docker.tgz "https://download.docker.com/linux/static/stable/$(uname -m)/docker-${DOCKER_VERSION}.tgz"
RUN tar xfv docker.tgz
RUN rm docker.tgz
RUN mkdir -p "$DOCKER_CONFIG/cli-plugins"
RUN curl -SL "https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-$(uname -m)" -o "$DOCKER_CONFIG/cli-plugins/docker-compose"
RUN chmod +x "$DOCKER_CONFIG/cli-plugins/docker-compose"

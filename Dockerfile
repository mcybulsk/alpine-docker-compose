FROM alpine:19

ENV DOCKER_VERSION=22.0.0
ENV DOCKER_COMPOSE_VERSION=2.25.0

ENV PATH="$PATH:$PWD/docker"
ENV DOCKER_CONFIG="${DOCKER_CONFIG:-$HOME/.docker}"

RUN apk add curl
RUN curl -o docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz
RUN tar xfv docker.tgz
RUN export PATH=$PATH:$PWD/docker
RUN export DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
RUN mkdir -p $DOCKER_CONFIG/cli-plugins
RUN curl -SL https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
RUN chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

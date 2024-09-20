FROM alpine:3.20

# renovate: datasource=github-tags depName=docker/cli
ENV DOCKER_VERSION="v27.3.0"
# renovate: datasource=github-tags depName=docker/compose
ENV DOCKER_COMPOSE_VERSION="v2.29.7"

ENV DOCKER_CONFIG="${DOCKER_CONFIG:-$HOME/.docker}"

RUN apk add curl
RUN curl -o docker.tgz "https://download.docker.com/linux/static/stable/$(uname -m)/docker-${DOCKER_VERSION:1}.tgz"
RUN tar xfv docker.tgz
RUN rm docker.tgz
RUN mv docker/* /usr/local/bin/
RUN rm -rf docker/
RUN mkdir -p "$DOCKER_CONFIG/cli-plugins"
RUN curl -SL "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-linux-$(uname -m)" -o "$DOCKER_CONFIG/cli-plugins/docker-compose"
RUN chmod +x "$DOCKER_CONFIG/cli-plugins/docker-compose"

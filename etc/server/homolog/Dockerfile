FROM elixir:1.6.0-alpine

ENV LANG=en_US.UTF-8
ENV HOME=/opt/app/
ENV TERM=xterm
ENV MIX_ENV=prod
ENV MIX_HOME=/opt/cache/.mix
ENV HEX_HOME=/opt/cache/.hex
ENV DIST_HOME=/opt/cache/.releases
ENV NPM_CONFIG_LOGLEVEL info
ENV REPLACE_OS_VARS true

RUN mkdir -p "${HOME}" && \
    adduser -s /bin/sh -u 1001 -G root -h "${HOME}" -S -D default && \
    chown -R 1001:0 "${HOME}"

WORKDIR ${HOME}

COPY . .

RUN apk update && apk add -u musl musl-dev musl-utils nodejs-npm build-base git
RUN mix local.hex --force && mix local.rebar --force

VOLUME /opt/cache/.mix /opt/cache/.hex /etc/apk/cache /opt/app/etc/rel_build

RUN mix do compile

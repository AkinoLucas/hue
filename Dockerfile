# Use an official Elixir runtime as a parent image
FROM elixir:1.6.0-alpine

ENV HOME=/app

RUN apk update && apk add -u postgresql-client

# Create app directory and copy the Elixir projects into it
RUN mkdir -p "${HOME}" && \
    adduser -s /bin/sh -u 1001 -G root -h "${HOME}" -S -D default && \
    chown -R 1001:0 "${HOME}"

WORKDIR ${HOME}

COPY . .

# Install hex package manager
RUN mix local.hex --force

# Compile the project
RUN mix do compile

CMD ["/app/entrypoint.sh"]

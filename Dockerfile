FROM elixir:1.11-alpine

RUN mkdir /app; mix local.hex --force

COPY setup.sh /
COPY startup.sh /

RUN apk update && \
    apk upgrade && \
    apk add git && \
    apk add grep && \
    apk add inotify-tools

RUN mix local.rebar --force
RUN mix local.hex

ENV RUNNING_IN_DOCKER="true"
ENV DEVELOPMENT=""

CMD ["/bin/sh","startup.sh"]

EXPOSE 4000
EXPOSE 80

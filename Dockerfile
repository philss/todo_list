FROM elixir:1.8.1-alpine
EXPOSE 4000

ENV APP_PATH /app

RUN mix local.hex --force \
  && mix local.rebar --force \
  && apk --no-cache --update add bash alpine-sdk coreutils curl \
  && rm -rf /var/cache/apk/* \
  && mkdir $APP_PATH

COPY . $APP_PATH
WORKDIR $APP_PATH

RUN mix deps.get

CMD ["mix", "phx.server"]

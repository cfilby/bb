FROM elixir:1.9 AS builder

WORKDIR /usr/app
COPY . .
RUN mix deps get
RUN MIX_ENV=prod mix release

FROM alpine

COPY --from=builder /usr/app/_build/prod/rel/bb/bin/bb /usr/local/bin/bb
CMD ["/usr/locl/bin/bb", "start"]
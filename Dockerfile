FROM rust:1.76 as build

WORKDIR /usr/src/prj-gonzo
COPY ./app /usr/src/prj-gonzo/app
RUN cargo build --path /usr/src/prj-gonzo/app/main.rs

FROM debian:buster-slim as production
COPY --from=build /usr/local/cargo/bin/main /usr/local/bin/main
CMD ["rust-app"]

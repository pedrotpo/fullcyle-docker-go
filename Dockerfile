FROM golang:1.22.4-alpine AS base

WORKDIR /usr/src/app

RUN go mod init example/hello

COPY ./hello.go .

RUN go build hello.go

FROM scratch AS build

COPY --from=base /usr/src/app/hello .

ENTRYPOINT [ "./hello" ]

FROM golang:1.16 AS build-stage
WORKDIR /usr/src/app
COPY . .
RUN CGO_ENABLED=0 go build

FROM scratch
WORKDIR /usr/src/app
COPY --from=build-stage /usr/src/app/ /usr/src/app/
EXPOSE 8080
ENTRYPOINT ["./server"]

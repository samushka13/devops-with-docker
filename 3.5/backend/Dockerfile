FROM alpine:latest
WORKDIR /usr/src/app
RUN apk add --no-cache go
COPY . .
ENV REQUEST_ORIGIN=http://localhost:5000
RUN go build
RUN go test ./...
RUN adduser -S backenduser
USER backenduser
EXPOSE 8080
CMD ["./server"]

# FROM golang:1.16
# WORKDIR /usr/src/app
# COPY . .
# ENV REQUEST_ORIGIN=http://localhost:5000
# RUN go build
# RUN go test ./...
# RUN adduser backenduser
# USER backenduser
# EXPOSE 8080
# CMD ["./server"]

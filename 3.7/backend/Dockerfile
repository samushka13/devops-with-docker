FROM alpine:3.16.0
WORKDIR /usr/src/app
COPY . .
ENV REQUEST_ORIGIN=http://localhost:5000
RUN apk add --no-cache go && \
    go build && \
    adduser -S backenduser && \
    apk del go
USER backenduser
EXPOSE 8080
CMD ["./server"]

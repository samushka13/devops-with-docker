FROM golang:1.24
WORKDIR /myproject
COPY . .
RUN go build
ENV REQUEST_ORIGIN=http://localhost:5000
EXPOSE 8080
CMD [ "./server" ]

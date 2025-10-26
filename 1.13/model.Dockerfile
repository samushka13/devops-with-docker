FROM golang:1.24
WORKDIR /myproject
COPY . .
RUN go build
EXPOSE 8080
CMD [ "./server" ]

FROM alpine:3.16.0
WORKDIR /usr/src/app
COPY . .
ENV REACT_APP_BACKEND_URL=http://localhost/api
RUN apk add --no-cache nodejs npm && \
    npm ci && \
    npm run build && \
    npm install -g serve && \
    adduser -D frontenduser
USER frontenduser
EXPOSE 5000
CMD ["serve", "-s", "-l", "5000", "build"]

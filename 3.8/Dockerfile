FROM alpine:3.16.0 AS build-stage
WORKDIR /usr/src/app
COPY . .
ENV REACT_APP_BACKEND_URL=http://localhost/api
RUN apk add --no-cache nodejs npm && \
    npm ci && \
    npm run build

FROM busybox:1.36
COPY --from=build-stage /usr/src/app/build/ /usr/src/app/
RUN adduser -D frontenduser
USER frontenduser
EXPOSE 5000
CMD ["busybox", "httpd", "-f", "-v", "-p", "5000"]

# FROM node:16-alpine3.18
# WORKDIR /usr/src/app
# RUN adduser -D frontenduser && npm install -g serve
# USER frontenduser
# COPY --from=build-stage /usr/src/app/build/ /usr/src/app/build
# CMD ["serve", "-s", "-l", "5000", "build"]

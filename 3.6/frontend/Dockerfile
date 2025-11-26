FROM node:16
WORKDIR /usr/src/app
COPY . .
ENV REACT_APP_BACKEND_URL=http://localhost/api
RUN npm ci && \
    npm run build && \
    npm install -g serve && \
    useradd -m frontenduser
USER frontenduser
EXPOSE 5000
CMD ["serve", "-s", "-l", "5000", "build"]

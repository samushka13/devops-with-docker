FROM node:16
WORKDIR /usr/src/app
COPY . .
ENV REACT_APP_BACKEND_URL=http://localhost/api
RUN npm ci
RUN npm run build
RUN npm install -g serve
RUN useradd -m frontenduser
USER frontenduser
EXPOSE 5000
CMD ["serve", "-s", "-l", "5000", "build"]

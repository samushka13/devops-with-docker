# FROM node:16
# COPY . .
# RUN npm install
# CMD node index.js

FROM node:16-alpine
COPY . .
RUN npm ci && \
    adduser -D appuser && \
    chown appuser .
USER appuser
CMD ["node", "index.js"]

FROM node:12-bullseye

# Setup apt-get parameters
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

RUN echo "NODE Version:" && node --version
RUN echo "NPM Version:" && npm --version

WORKDIR /usr/src/app

# Get deps in their own layer
COPY package*.json ./
RUN npm ci

# Bundle app source
COPY . ./

CMD ["server.js"]

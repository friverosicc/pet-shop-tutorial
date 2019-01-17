# Node image
FROM node:latest

USER node

WORKDIR /home/node

RUN mkdir /home/node/.npm-global \
    mkdir /home/node/app

ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

# Install Truffle
RUN npm install -g truffle && npm config set bin-links false

WORKDIR /home/node/app

# Using node alpine version.
FROM node:19-alpine3.16

# Current version.
LABEL DOCKER_NODE_VERSION="19-alpine3.16"

# Official repository link.
LABEL IMAGE_REPOSITORY='https://github.com/nodejs/docker-node/blob/7abbf9f3d902b901da72714bcc30b5a92831547e/19/alpine3.16/Dockerfile'

# Vue CLI version argument.
ARG VUE_VERSION=latest

# Install Vue CLI.
RUN npm install -g @vue/cli@${VUE_VERSION}

# Set node user.
USER node

# Set working directory.
WORKDIR /home/node

# Using node alpine version.
FROM node:19-alpine3.16

# Current version.
LABEL DOCKER_NODE_VERSION="19-alpine3.16"

# Official repository link.
LABEL IMAGE_REPOSITORY='https://github.com/nodejs/docker-node/blob/7abbf9f3d902b901da72714bcc30b5a92831547e/19/alpine3.16/Dockerfile'

# Angular CLI version argument.
ARG ANGULAR_VERSION='latest'

# Install Angular CLI.
RUN npm install -g @angular/cli@${ANGULAR_VERSION}

# Set node user.
USER node

# Working directory argument.
ARG WORKING_DIRECTORY=/home/node

# Set working directory.
WORKDIR ${WORKING_DIRECTORY}

# Set working directory.
# WORKDIR /home/node

# docker run --rm --build -it node-angular ng new angular.emmanuel.toledo.app --directory ./
# docker-compose run --rm --build -it node-angular ng new angular.emmanuel.toledo.app --directory ./
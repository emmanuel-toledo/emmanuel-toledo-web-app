# Using local node-angular image.
FROM node-angular:latest

# Working directory argument.
ARG WORKING_DIRECTORY=/home/node

# Set working directory.
WORKDIR ${WORKING_DIRECTORY}

# Creation of image arguments.
ARG PROJECTNAME=app

# Copy of 'package.json' file to verify dependencies.
COPY /${PROJECTNAME}/package.json .

# Downloading all the dependencies.
RUN npm install

# Copy of project to working directory.
COPY /${PROJECTNAME} .

# Expose of used port.
EXPOSE 4200

# Excecution command for the application.
CMD [ "ng", "serve", "--host", "0.0.0.0" ]
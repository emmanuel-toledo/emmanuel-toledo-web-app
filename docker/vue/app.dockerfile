# Using local node-vue image.
FROM node-vue:latest

# Working directory argument.
ARG WORKING_DIRECTORY='app'

# Set working directory.
WORKDIR ${WORKING_DIRECTORY}

# Creation of image arguments.
ARG PROJECTNAME='app'

# Copy of 'package.json' file to verify dependencies.
COPY /${PROJECTNAME}/package.json .

# Downloading all the dependencies.
RUN npm install

# Copy of project to working directory.
COPY /${PROJECTNAME} .

# Expose of used port.
EXPOSE 8080

# Excecution command for the application.
CMD ["npm", "run", "serve"]
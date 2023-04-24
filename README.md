# Curriculum Online (Emmanuel Toledo)

The purpose of this repository is to store the ```Online Curriculum``` for ```Emmanuel Toledo```.

It contains two projects, the first one developed with ```Vue JS```, and the second one developed 
with ```Angular JS```, it is the same project but with different technologies.

This Repository works with Docker and uses a Docker Compose file.

## How to use in an Angular project?
### Getting started with Angular JS utility container

**Note:** If you already have a started project locally you could skip this section.

First that all you need to configure an utility container to work with ```Angular CLI``` and ```npm``` commands, for this you can use
```node.angular.dockerfile``` file.

In this file you could change the version of ```Angular CLI``` if you need it by the use of an ```argument``` in the ```dockerfile```. The default version is ```latest```.

You can only execute the ```build``` of the image with the following command.

```
docker build . -t node-angular:latest -f docker/angular/node.angular.dockerfile
```

With this image created you can execute different ```ng``` and ```npm``` commands.

```
docker run --rm -it --mount type=bind,source="$(pwd)"/my.app,target=/home/node node-angular:latest ng new my.app --directory ./
```

If you want to create a new project, you migth consider to create previously the folder where the project will be created, because if you do not create the folder, you will have to probide grant to this once the project is already created.

The default owner of the project is the ```root``` user in ```Linux```.

If you want to use ```docker-compose.yaml``` file you can do this.

```
version: '3.8'
services:

  # Angular utility container
  node-angular:
    container_name: node-angular-container
    image: node-angular:latest
    build: 
      context: ./
      dockerfile: docker/angular/node.angular.dockerfile
      args:
        - ANGULAR_VERSION=latest
    volumes:
      - ./my.app:/home/node
```

You can also create the ```build``` of the image with ```docker-compose``` command.

```
docker-compose build node-angular
```

Another alternative is execute directly a ```run``` command with ```docker compose```. Remember that is recomended create first the folder of the new project, in your local project before to execute this command as was explained before.

```
docker-compose run --rm --build -it node-angular ng new my.app --directory ./
```

You can add too a new dependency using Angular CLI.

```
docker-compose run --rm --build -it node-angular ng generate module shared
```
or
```
docker-compose run --rm -d node-angular ng generate module new
```

If you execute one of these commands and you did not create the project folder before, you can use the  ```chown``` command in  ```Linux``` to provide the permissions of this new folder.

If your container is still running, you can execute ```docker stop``` command.

```
docker stop ${your container id or name}
```

### Getting started with Angular JS app container

If you already have an ```Angular JS``` project you could only start it with the following command.

```
docker-compose up --build -d app-angular

docker-compose -f ./angular.docker-compose.yaml up --build -d app-angular
```

To stop the project just use.

```
docker-compose down -v

docker-compose -f ./angular.docker-compose.yaml down -v
```

You only must be sure to modify the ```docker-compose.yaml``` file with the needs volumes and bind mounts.

The ```service``` used for this ```app container``` requires the ```utility container``` that is in the previous section. 

You just need to execute the following command and then execute the  ```docker-compose up``` command showed in this section.

```
docker build . -t node-angular:latest -f docker/angular/node.angular.dockerfile
```

With this you will see your application running in ```https://localhost```.










### Angular JS Utility Container

The Docker Compose file contains an ```Utility Container``` (*service*) named ```node-angular```.

This container uses an Image where will be already installed ```Angular CLI library```.

```
docker-compose run --rm --build -it node-angular ng new my.new.project
```
Or maybe to add a new dependency using Angular CLI.
```
docker-compose run --rm -it node-angular ng generate module shared
```

## Getting Started with Vue JS Project

To start the project with ```Vue JS``` you must to excecute the following command.

```
docker-compose up --build -d app-vue
```

To stop the project just use.

```
docker-compose down -v
```

### Vue JS Utility Container

The Docker Compose file contains an ```Utility Container``` (*service*) named ```node-vue```.

This container uses an Image where will be already installed ```Vue CLI library```.

```
docker-compose run --rm --build -it node-vue create my.new.project
```
# Containerizing an Express server.
This repository is a step by step guide for setting up and containerizing an express server. This repository also serves as a complementary guide for this [article](https://pogsdotnet.blogspot.com/2018/08/10-steps-to-setup-and-containerize.html).

# Environment Setup

- NodeJS Installed ([Download Here](https://nodejs.org/en/download/))
- Express Generator ([Installation Guide Here](https://expressjs.com/en/starter/generator.html))
- Docker ([Download Here](https://www.docker.com/get-started))

# Steps
1. Create a folder
2. Open a terminal and initial NPM on the folder.

```sh
npm init -y
```

3. Install express-generator

```sh
npm install express-generator -g
```

4. Bootstrap application skeleton

```sh
express --view=pug
```

5. Install express server dependencies

```sh
npm install
```

6. Add a docker file from iron/node

```dockerfile
FROM iron/node
WORKDIR /app

# Copy package.json + package-lock.json files
COPY package*.json ./

# Installing dependencies
RUN npm install

# Bundle app source
COPY . .

EXPOSE 3000

ENTRYPOINT [ "npm", "start" ]
```

7. Add the .dockerignore file below

```.dockerignore
node_modules
npm-debug.log
```

8. Create a docker image by executing the command below on your app folder.

```sh
build --tag express/iron-api .
```

9. Verify that your docker image was built.

```sh
docker images --all
```

10. Instantiate a container out of the image you created.

```sh
docker run -p 3000:3000 --name iron-api express/iron-api
```

11. Open the following link on a browser. http://localhost:3000/

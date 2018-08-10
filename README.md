# Containerizing an Express server.
This repository is a step by step guide for setting up and containerizing an express server.

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
ADD . /app
ENTRYPOINT [ "node", "server.js" ]
```

7. Create a docker image by executing the command below on your app folder.

```sh
build --tag express-iron-node .
```

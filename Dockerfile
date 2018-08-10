FROM iron/node
WORKDIR /app
ADD . /app
ENTRYPOINT [ "node", "server.js" ]
#!/bin/bash
set -ex
if [[ "$(docker images -q hassam1989/php-alpine:latest 2> /dev/null)" == "" ]]; then
  docker build -f docker/DockerPhpBuild -t hassam1989/php-alpine:latest .
fi


rm -rf node_modules
docker run -w /app -v $(pwd)/hassam/:/app node npm install
docker run -w /app -v $(pwd)/hassam/:/app node npm run dev
docker build -f docker/DockerPhpLive -t hassam1989/php-live:latest ./hassam/
docker build -f docker/DockerNginx -t hassam1989/php-nginx:latest ./hassam/
docker push hassam1989/php-live:latest
docker push hassam1989/php-nginx:latest

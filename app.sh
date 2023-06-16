#!/bin/bash


if [ "$1" == "init" ] && [ "$2" == "react" ]; then
    docker-compose stop
    docker-compose down -v
    rm -rf frontend
    rm -rf backend

    mkdir "backend"
    mkdir "frontend"
    docker-compose run --rm backend bash -c "npm install -g @nestjs/cli && nest new . --skip-git"
    docker-compose run --rm frontend bash -c "npm install -g create-vite vite && create-vite . --template react-ts"
    docker-compose up
fi


if [ "$1" == "init" ]; then
    docker-compose down -v
    rm -rf frontend
    rm -rf backend

    mkdir "backend"
    mkdir "frontend"
    docker-compose run --rm backend bash -c "npm install -g @nestjs/cli && nest new . --skip-git"
    docker-compose run --rm frontend bash -c "npm install -g create-vite vite && create-vite . --template vue-ts"
    docker-compose up
fi

if [ "$1" == "backend" ]  && [ "$2" == "i" ]; then
    args=("$@")
    str="${args[@]:1}"
    docker-compose run backend bash -c "npm i $str"
    exit 0
fi

if [ "$1" == "frontend" ]  && [ "$2" == "i" ]; then
    args=("$@")
    str="${args[@]:2}"
    echo $str
    docker-compose run frontend bash -c "npm i $str"
    exit 0
fi


if [ "$1" == "backend" ]  && [ -z "$2" ]; then
    docker exec -it backend bash
    exit 0
fi

if [ "$1" == "frontend" ]  && [ -z "$2" ]; then
    docker exec -it frontend bash
    exit 0
fi


if [ "$1" == "stop" ]; then
  docker-compose stop
fi

if [ -z "$1" ]; then
    docker-compose up
fi

echo "$1 command not found"
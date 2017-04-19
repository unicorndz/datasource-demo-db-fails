#!/usr/bin/env bash

docker run -p3306:3306 --name mysql-dev -e MYSQL_ROOT_PASSWORD=root -d mysql:latest

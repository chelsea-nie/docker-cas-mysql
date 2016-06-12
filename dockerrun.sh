#!/bin/sh

docker run -d -p 8080:8080 --name=cas_mysql docker_cas_mysql

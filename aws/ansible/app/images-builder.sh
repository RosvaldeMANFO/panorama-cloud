#!/bin/sh

docker image build -t 127.0.0.1:5000/backend:todo-backend -f backend/Dockerfile backend
docker image push 127.0.0.1:5000/backend:todo-backend
docker image build -t 127.0.0.1:5000/client:todo-client -f client/Dockerfile client
docker image push 127.0.0.1:5000/client:todo-client
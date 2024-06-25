#!/bin/sh

docker container run -it -v ${PWD}/terraform:/app -w /app --rm hashicorp/terraform init

docker container run -it -v ${PWD}/terraform:/app -w /app --rm hashicorp/terraform plan

docker container run -it -v ${PWD}/terraform:/app -w /app --rm hashicorp/terraform apply
#!/bin/sh

docker container run -it -v ${PWD}/terraform:/app -w /app --rm hashicorp/terraform init

docker container run -it -v ${PWD}/terraform:/app -w /app --rm hashicorp/terraform plan

docker container run -it -v ${PWD}/terraform:/app -w /app --rm --env-file .env  hashicorp/terraform apply -var "aws_access_key=$AWS_ACCESS_KEY" -var "aws_secret_key=$AWS_SECRET_KEY"


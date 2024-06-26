#!/bin/sh

docker container run -it -v ${PWD}/terraform:/app -w /app --rm hashicorp/terraform destroy
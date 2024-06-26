#!/bin/sh

export $(grep -v '^#' .env | xargs)

cat <<EOF > aws_ec2.yml
---
plugin: amazon.aws.aws_ec2
aws_access_key: $ACCESS_KEY
aws_secret_key: $SECRET_KEY

regions:
  - us-east-1
keyed_groups:
  - key: tags.Name
    prefix: tag_Name
EOF

chmod 400 ./mykey.pem

ansible-playbook -i aws_ec2.yml playbooks/main.yml

read
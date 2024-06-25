#/bin/sh

sh ./aws/launch.sh
docker build -t ansible:2.16 ${PWD}/aws
docker container run --rm -v ${PWD}/aws/ansible:/playbooks ansible:2.16 /bin/sh launch.sh
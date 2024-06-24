FROM ansible:2.16

WORKDIR /playbooks

COPY ./ansible/ .

RUN chmod 700 ./secrets/myKey.pem

CMD ["ansible-playbook", "-i", "inventory.ini", "playbook.yml"]
docker service create --name registry -p 5000:5000 registry
sh ./images-builder.sh
docker stack deploy -c ./docker-compose-deploy.yml todo_app
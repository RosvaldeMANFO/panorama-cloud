#!/bin/sh

multipass set local.privileged-mounts=Yes

join_swarm() {
    local node_type=$1
    local instance_name=$2

    # Check if the node_type is valid
    if [[ "$node_type" != "worker" && "$node_type" != "manager" ]]; then
        echo "Invalid node type. Use 'worker' or 'manager'."
        return 1
    fi

    # Get the join token command based on the node type
    if [[ "$node_type" == "manager" ]]; then
        output=$(multipass exec manager -- docker swarm join-token manager)
    else
        output=$(multipass exec manager -- docker swarm join-token worker)
    fi
    join_command=$(echo "$output" | grep "docker swarm join" | sed -e 's/^[[:space:]]*//')

    # Check if the join command was extracted successfully
    if [[ -n "$join_command" ]]; then
        echo "Executing join command on instance $instance_name..."
#        echo "$join_command"
        # Execute the join command on the specified instance using SSH
        eval "multipass exec $instance_name -- $join_command"
    else
        echo "Error: Unable to extract join command."
        return 1
    fi
}

multipass launch --name manager --mount .:/mnt/docker docker
# multipass launch  --name worker1 docker
# multipass launch  --name worker2 docker

multipass exec manager -- docker swarm init
multipass exec manager -- docker service create --name registry -p 5000:5000 registry
multipass exec manager -- sudo sh /mnt/docker/images-builder.sh

# join_swarm "worker" "worker1"
# join_swarm "worker" "worker2"

# multipass shell manager
# docker stack deploy -c /mnt/docker/docker-compose.yml todo_app
# docker service scale todo_backend=2

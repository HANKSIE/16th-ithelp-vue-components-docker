#!/usr/bin/env bash

source "$(pwd)/.env"
source "$(pwd)/bin/helper.sh"

volume_dir="$(pwd)/app"

chown_volume_dir(){
    echo_action "變更 $volume_dir 擁有者"
    sudo chown -R $USER: "$1"
}

create_volume_dir(){
    echo_action "建立 $volume_dir"
    docker run \
        --rm \
        -w /app \
        -v "$volume_dir":/app \
        $IMAGE_NAME \
        bash -c "git clone https://github.com/Mini-ghost/16th-ithelp-vue-components.git && mv ./16th-ithelp-vue-components/{.,}* ./ && rm -r ./16th-ithelp-vue-components && pnpm install"
}

docker_rmi(){
    docker rmi $IMAGE_NAME
}

docker_build(){
    docker build . -t $IMAGE_NAME
}

docker_start(){
    docker restart $CONTAINER_NAME
}

docker_stop(){
    docker stop $CONTAINER_NAME
}

docker_rm(){
    docker rm $CONTAINER_NAME
}

reset(){
    docker_stop
    docker_rm
    docker_rmi
}

docker_run(){

    if [[ ! -d "$volume_dir" ]]
    then
        create_volume_dir
        chown_volume_dir "$volume_dir"
    fi
    
    docker run \
        -d \
        -p $LOCAL_PORT:5173 \
        -w /app \
        -v "$volume_dir":/app \
        --name $CONTAINER_NAME \
        $IMAGE_NAME \
        bash -c "pnpm dev --host=0.0.0.0"
}

docker_up(){
    is_container_exists="$(docker ps -a -q -f name=$CONTAINER_NAME)"

    if [[ $is_container_exists = true ]]
    then
        docker_start
    else
        docker_build
        docker_run
    fi
}

docker_down(){
    docker_stop
    docker_rm
}

 

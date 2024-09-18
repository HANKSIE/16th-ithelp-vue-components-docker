#!/usr/bin/env bash

source "$(pwd)/.env"

BOLD='\033[1m'
RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
COLOR_OFF='\033[0m'

# 顯示當前動作
echo_action(){
    echo -e "${YELLOW}$1${COLOR_OFF}"
}

start_exit(){
    echo -e "${GREEN}done${COLOR_OFF}"
    echo -e "open ${BLUE}http://localhost:$LOCAL_PORT${COLOR_OFF}"
    exit 0
}

done_exit(){
    echo -e "${GREEN}done${COLOR_OFF}"
    exit 0
}

unknown_cmd_exit(){
    echo -e "${BOLD}unknown cmd${COLOR_OFF}"
    exit 0
}
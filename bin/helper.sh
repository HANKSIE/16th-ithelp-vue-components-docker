#!/usr/bin/env bash

source "$(pwd)/.env"

BOLD='\033[1m'
RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
COLOR_OFF='\033[0m'

# 如果有錯誤就顯示錯誤, 沒錯誤就正常結束程序
safe_exit(){
    exit_if_err
    # 正常結束程序
    exit 0
}

# 如果有錯誤就顯示錯誤並結束程序
exit_if_err(){
    if [[ $? -ne 0 ]]
    then
        echo -e "${RED}fail${COLOR_OFF}"
        # 非正常結束程序
        exit 1
    fi
}

# 顯示當前動作
echo_action(){
    echo -e "${YELLOW}$1${COLOR_OFF}"
}

start_exit(){
    exit_if_err
    echo -e "${GREEN}done${COLOR_OFF}"
    echo -e "open ${BLUE}http://localhost:$LOCAL_PORT${COLOR_OFF}"
    safe_exit
}

done_exit(){
    exit_if_err
    echo -e "${GREEN}done${COLOR_OFF}"
    safe_exit
}

unknown_cmd_exit(){
    exit_if_err
    echo -e "${BOLD}unknown cmd${COLOR_OFF}"
    safe_exit
}
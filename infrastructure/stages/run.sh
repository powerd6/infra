#!/bin/bash

check_variable() {
    local var_name=$1

    if [ -z "${!var_name}" ]; then
        echo "Error: Variable '$var_name' is not set."
        exit 1
    fi
}

wait_for_enter() {
    echo "Press Enter to continue..."
    read -r
    echo "You pressed Enter. Continuing..."
}

start_dir=$(pwd)
change_stage() {
    local name=$1
    echo "Stage: $name"
    cd "$start_dir/$name"
}

init_plan_apply() {
    tofu init
    tofu plan -out plan -json
    wait_for_enter
    tofu apply "plan"
    rm plan
}

echo "Executing all stages..."

change_stage "0-state"
check_variable "ELEPHANTSQL_APIKEY"
init_plan_apply
export PG_CONN_STR=$(tofu output -raw psql_url)

change_stage "1-github"
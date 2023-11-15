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
    export PG_SCHEMA_NAME="$name"
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
check_variable "PG_CONN_STR"
check_variable "PG_SCHEMA_NAME"
init_plan_apply
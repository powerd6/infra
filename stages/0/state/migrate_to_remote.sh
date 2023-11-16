#!/bin/bash

if [ "${IS_BOOTSTRAP}" == "true" ]; then
  # This will not run when IS_BOOTSTRAP=true
  exit 0  # Continue with the Terraform/Terragrunt command
fi

file_path=terraform.tfstate

if [ -e "$file_path" ]; then
    echo "Found local terraform state."
    echo "Migrating the state from local to remote"
    export PG_CONN_STR=$(jq -r '.outputs.psql_url.value' terraform.tfstate)
    tofu init -migrate-state -force-copy
    tofu plan -detailed-exitcode
    echo "Deleting local state"
    rm terraform.tfstate
    echo "Migration completed. Please re-run the command"
    exit 1  # Exit with error, skipping further execution
fi

exit 0

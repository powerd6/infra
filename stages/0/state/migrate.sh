#!/bin/bash

echo "Migrating the state from local to remote"
export PG_CONN_STR=$(jq -r '.outputs.psql_url.value' terraform.tfstate)
tofu init -migrate-state -force-copy
tofu plan -detailed-exitcode
echo "Deleting local state"
rm terraform.tfstate
echo "Migration completed."
#!/bin/bash

if [ "${IS_BOOTSTRAP}" == "true" ]; then
  echo "Skipping module due to IS_BOOTSTRAP=true"
  exit 1  # Exit with error, skipping further execution
else
  exit 0  # Continue with the Terraform/Terragrunt command
fi
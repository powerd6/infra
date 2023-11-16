#!/bin/bash

file_path=terraform.tfstate

if [ -e "$file_path" ]; then
    echo "Found local terraform state."
    echo "Will trigger migration"
    exit 0
else
    echo "No local terraform state found."
    exit 1
fi

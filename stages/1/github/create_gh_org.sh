#!/bin/bash

if [ "${IS_BOOTSTRAP}" == "true" ]; then
    echo "You must create an organization manually on https://github.com/account/organizations/new?plan=free"
    echo "Press Enter once it's created..."
    read -r
    echo "Fetching the organization ID from the API"
    ORG_ID=$(gh api \
        -H "Accept: application/vnd.github+json" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        /orgs/powerd6 | jq -r '.id')
    tofu init
    tofu import github_organization_settings.powerd6 $ORG_ID
    exit 1  # Abort command and try again
fi

exit 0

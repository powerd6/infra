# Bootstrapping

In the case of first execution or of a disaster, this repository might not work properly.

This document will detail how to use this repository for the initial setup, sharing detailed steps.

> ❗️ **Important**: In the case of a disaster, not all of these steps are necessary and following them to the letter might cause further loss.

## Steps

1. Create an [ElephantSQL](https://www.elephantsql.com/) account and fetch an API key.

    Once the account is created, retrieve an API key store it under the `ELEPHANTSQL_APIKEY` environment variable:

    ```bash
    read -s ELEPHANTSQL_APIKEY
    export ELEPHANTSQL_APIKEY
    ```

1. Get the [gandi.net](https://gandi.net) API key.

    Retrieve the API key (and not a PAT), and save it under the `GANDI_KEY` environment variable:

    ```bash
    read -s GANDI_KEY
    export GANDI_KEY
    ```

1. Switch into bootstrap mode

    Set the `BOOTSTRAP` environment variable to `true`:

    ```bash
    export BOOTSTRAP=true
    ```

1. Create a github organization named `powerd6`.

    After creating it, fetch the organization ID from the api:

    ```bash
    export GH_ORG_ID=$(gh api /orgs/powerd6 | jq -r '.id')
    ```

    Once created, enable the usage of Personal access tokens for the organization with the following settings:

    - Allow access via fine-grained personal access tokens
    - Require administrator approval
    - Restrict access via personal access tokens (classic)

1. Create a super-admin PAT for the GitHub organization

    This token will be used for the creation and management of multiple aspects of the project.

    It should have the following permissions:

    - Repository access: All repositories
    - Repository permissions:
        - Administration: Read and write
        - Commit statuses: Read and write
        - Contents: Read and write
        - Issues: Read and write
        - Metadata: Read-only
        - Secrets: Read and write
        - Workflows: Read and write
    - Organization permissions:
        - Administration: Read and write
        - Members: Read and write
        - Secrets: Read and write
        - Variables: Read and write

    Store it under the `GH_ADMIN_TOKEN` environment variable:

    ```bash
    read -s GH_ADMIN_TOKEN
    export GH_ADMIN_TOKEN
    ```

1. Initialize all the modules

    From the root of the repository, run:

    ```bash
    terragrunt run-all init
    ```

    This step should fail.

1. Import the existing GitHub organization into the state

    This is necessary because organizations cannot be created by terraform.
    
    ```bash
    (
        cd stages/1/github/ &&
        tofu import github_organization_settings.powerd6 $GH_ORG_ID
    )
    ```

1. Import the existing domain into the state

    This is necessary because domains cannot be created by terraform.
    
    ```bash
    (
        cd stages/1/domain/ &&
        tofu import gandi_domain.powerd6_org powerd6.org
    )
    ```
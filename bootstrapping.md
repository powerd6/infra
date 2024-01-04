# Bootstrapping

In the case of first execution or of a disaster, this repository might not work properly.

This document will detail how to use this repository for the initial setup,
 sharing detailed steps.

> ❗️ **Important**: In the case of a disaster, not all of these steps are
> necessary and following them to the letter might cause further loss.

## Steps

1. Create an [ElephantSQL](https://www.elephantsql.com/) account and fetch an
 API key.

    Once the account is created, retrieve an API key store it under the
     `ELEPHANTSQL_APIKEY` environment variable:

    ```bash
    read -s ELEPHANTSQL_APIKEY
    export ELEPHANTSQL_APIKEY
    ```

1. Get the [gandi.net](https://gandi.net) API key.

    Retrieve the API key (and not a PAT), and save it under the `GANDI_KEY`
     environment variable:

    ```bash
    read -s GANDI_KEY
    export GANDI_KEY
    ```

1. Get an [ImprovMX](https://improvmx.com/) API key.

    Retrieve the API key , and save it under the `IMPROVMX_API_TOKEN` environment
     variable:

    ```bash
    read -s IMPROVMX_API_TOKEN
    export IMPROVMX_API_TOKEN
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

    Once created, enable the usage of Personal access tokens for the organization
     with the following settings:

    - Allow access via fine-grained personal access tokens
    - Require administrator approval
    - Restrict access via personal access tokens (classic)

1. Create a super-admin PAT for the GitHub organization

    This token will be used for the creation and management of multiple aspects
     of the project.

    It should have the following permissions:

    - Repository access: All repositories
    - Repository permissions:
        - Actions: Read and write
        - Administration: Read and write
        - Commit statuses: Read and write
        - Contents: Read and write
        - Environments: Read and write
        - Issues: Read and write
        - Metadata: Read-only
        - Pages: Read and write
        - Pull requests: Read and write
        - Secrets: Read and write
        - Workflows: Read and write
    - Organization permissions:
        - Administration: Read and write
        - Members: Read and write
        - Projects: Read and write
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

    This step should work. If it fails, the error message will tell you why.
    Most likely, a variable that is required is not setup correctly.

1. Import the existing GitHub organization into the state

    This is necessary because organizations cannot be created by terraform.

    ```bash
    cd stages/github
    terragrunt import github_organization_settings.powerd6 $GH_ORG_ID
    cd ../../
    ```

1. Import the existing domain into the state

    This is necessary because domains cannot be created by terraform.

    ```bash
    cd stages/domain
    terragrunt import gandi_domain.powerd6_org powerd6.org
    cd ../../
    ```

1. Delete the currently configured gandi.net DNS records

    This is necessary because DNS records cannot be imported.

1. Import the existing email forwarding domain into the state

    This is necessary because domains cannot be created by terraform.

    ```bash
    cd stages/email
    terragrunt import improvmx_domain.domain powerd6.org
    cd ../../
    ```

1. Apply all the modules

    From the root of the repository, run:

    ```bash
    terragrunt run-all apply
    ```

    This step should work. If it fails, the error message will tell you why.
    Most likely, a variable that is required is not setup correctly.

1. Fetch the valid PSQL connection string

    Set the `PG_CONN_STR` environment variable with:

    ```bash
    cd stages/state
    export PG_CONN_STR=$(terragrunt output -raw psql_url)
    cd ../../
    ```

1. Switch out of the bootstrap mode

    Unset the `BOOTSTRAP` environment variable:

    ```bash
    unset BOOTSTRAP
    ```

1. Migrate all the modules

    From the root of the repository, run:

    ```bash
    terragrunt run-all init -migrate-state  -force-copy -lock=false
    ```

    This step should work. If it fails, the error message will tell you why.
    Most likely, a variable that is required is not setup correctly.

1. Apply all the modules

    From the root of the repository, run:

    ```bash
    terragrunt run-all apply
    ```

    This step should work and show no changes. If it does, then you are done!

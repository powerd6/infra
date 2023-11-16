# Stages

## Inputs

You must provide the following environment variables in all stages, in addition to the stage-specific ones:

### `PG_CONN_STR`

The elephantSQL API key. Fetched locally once, then saved to GitHub Organization
 secrets for future use.

Fetched once from stage 0, with the following command: `tofu output -raw elephantsql_api_key`.
From this moment forward, available as a GitHub Organization secret.

## Bootstrapping

This is how you execute this stack when nothing is set-up.

This is useful for bootstrapping the project or to recover from a total disaster.


> ⚠️ **Important:** The following commands assume you are executing from the root of
 the repository.

These are the steps that will be executed:

1. Cleanup local directory of states <font color="red">(optional)</font>

    Remove previously executed terraform states, otherwise the procedure will fail.

    ```bash
    rm -rf **/.terraform
    ```

1. Change into bootstrap mode:

    Set the environment variable  `IS_BOOTSTRAP` set to true.

    ```bash
    export IS_BOOTSTRAP=true
    ```

1. Provide required inputs

    Provide all the required inputs which would normally be provided by GitHub secrets:

    - `ELEPHANTSQL_APIKEY`
        A "Full Access key" for the [ElephantSQL](https://www.elephantsql.com/) account.

        Retrieved [here](https://customer.elephantsql.com/apikeys).
1. Apply changes

    Execute the following command to run all steps required for bootstrapping.

    ```bash
    terragrunt run-all apply
    ```

1. Fetch the new PSQL connection string

    Execute the following command to get the new connection string before resuming.

    ```bash
    export PG_CONN_STR=$(jq -r '.outputs.psql_url.value' stages/0/state/terraform.tfstate)
    ```

1. Change out of the bootstrap mode

    Remove the environment variable  `IS_BOOTSTRAP`.

    ```bash
    unset IS_BOOTSTRAP
    ```

1. Apply once more

    Execute the following command to run all steps required for migrating the state.

    ```bash
    terragrunt run-all apply
    ```

1. Apply a final time

    Execute the following command to run all steps with the new state.

    ```bash
    terragrunt run-all apply
    ```

The final script looks something like this:
<details>
<summary>Click to expand</summary>

```bash
clear
rm -rf **/.terraform         
export IS_BOOTSTRAP=true

echo "Input ELEPHANTSQL_APIKEY:"
read -s ELEPHANTSQL_APIKEY
export ELEPHANTSQL_APIKEY

terragrunt run-all apply

echo "The last command should have failed. This is expected"

export PG_CONN_STR=$(jq -r '.outputs.psql_url.value' stages/0/state/terraform.tfstate)

unset IS_BOOTSTRAP

terragrunt run-all apply

echo "The last command should have failed. This is expected"
echo "Migration done"

terragrunt run-all apply
```
</details>
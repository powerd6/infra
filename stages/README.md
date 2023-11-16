# Stages

## Inputs

You must provide the following environment variables in all stages, in addition to the stage-specific ones:

### `PG_CONN_STR`

The elephantSQL API key. Fetched locally once, then saved to GitHub Organization
 secrets for future use.

Fetched once from stage 0, with the following command: `tofu output -raw elephantsql_api_key`.
From this moment forward, available as a GitHub Organization secret.

## First-time setup

This is how you execute this stack as a first-time setup.
This is useful for bootstrapping the project or to recover from a total disaster.

1. Run the stack with the variable `is_bootstrap` set to true:

    ```bash
    export IS_BOOTSTRAP=true
    terragrunt run-all apply --work-dir=stages/
    ```

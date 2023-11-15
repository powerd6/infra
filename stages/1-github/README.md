# 1: github

This setups the GitHub organization and it's repositories.

## Inputs

You must provide the following environment variables:

### `PG_CONN_STR`

The connection string to the PSQL backend.

Fetched from stage 0, with the following command: `tofu output -raw psql_url`.

### `TF_VAR_elephantsql_api_key`

The elephantSQL API key. Fetched locally once, then saved to GitHub Organization
 secrets for future use.

Fetched once from stage 0, with the following command: `tofu output -raw elephantsql_api_key`.
From this moment forward, available as a GitHub Organization secret.

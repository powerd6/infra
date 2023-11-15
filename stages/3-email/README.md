# 3: email

This setups the Email aliases and forwarding.

## Inputs

You must provide the following environment variables:

### `PG_CONN_STR`

The connection string to the provisioned PSQL database from stage 0. Fetched
 locally once, then saved to GitHub Organization secrets for future use.

Fetched once from stage 0, with the following command: `tofu output -raw psql_url`.
From this moment forward, available as a GitHub Organization secret.

### `IMPROVMX_API_TOKEN`

The API token from [improvMX](https://improvmx.com/).

Fetched once from [this page](https://app.improvmx.com/api). From this moment
 forward, available as a GitHub Organization secret.

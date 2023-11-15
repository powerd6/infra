# 1: github

This setups the GitHub organization and it's repositories.

## Inputs

You must provide the following environment variables:

| variable | Description | Where to find it|
| ---: | :--- | :--- |
| `PG_CONN_STR` | The connection string to the PSQL backend | On stage 0: `tofu output -raw psql_url` |
| `TF_VAR_elephantsql_api_key` | The elephantSQL API key. Fetched locally once, then saved to GitHub Organization secrets for future use. | From GitHub Organization secrets. |


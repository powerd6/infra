# 2: domain

This setups the Domain, Nameservers and DNS records.

## Inputs

You must provide the following environment variables:

### `PG_CONN_STR`

The connection string to the provisioned PSQL database from stage 0. Fetched
 locally once, then saved to GitHub Organization secrets for future use.

Fetched once from stage 0, with the following command: `tofu output -raw psql_url`.
From this moment forward, available as a GitHub Organization secret.

### `GANDI_KEY`

The API key from [gandi.net](https://gandi.net).

Fetched once from the page `https://account.gandi.net/en/users/<username>/security`.
 Note that it must be an API Key, and not a PAT.
 From this moment forward, available as a GitHub Organization secret.

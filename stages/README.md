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

### 1: Change into bootstrap mode

Set the environment variable  `IS_BOOTSTRAP` set to true: `export IS_BOOTSTRAP=true`

### 2: Provide required inputs

Provide all the required inputs which would normally be provided by GitHub secrets:

#### `ELEPHANTSQL_APIKEY`

A "Full Access key" for the [ElephantSQL](https://www.elephantsql.com/) account.

Retrieved [here](https://customer.elephantsql.com/apikeys).
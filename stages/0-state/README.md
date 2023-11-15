# 0: state

This is the absolute first stage that needs to be executed.

It creates the PostgreSQL database that will be used to store other state files.

## Inputs

You must provide the following environment variables:

### `ELEPHANTSQL_APIKEY`

A "Full Access key" for the [ElephantSQL](https://www.elephantsql.com/) account.

Retrieved [here](https://customer.elephantsql.com/apikeys).

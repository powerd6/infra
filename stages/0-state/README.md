# 0: state

This is the absolute first stage that needs to be executed.

It creates the PostgreSQL database that will be used to store other state files.

## Inputs

You must provide the following environment variables:

| variable | Description | Where to find it|
| ---: | :--- | :--- |
| `ELEPHANTSQL_APIKEY` | A "Full Access key" for the [ElephantSQL](https://www.elephantsql.com/) account. | [here](https://customer.elephantsql.com/apikeys) |

# 0: state

This is the absolute first stage that needs to be executed.

It creates the PostgreSQL database that will be used to store other state files.

## Inputs

You must provide the following environment variables:

### `ELEPHANTSQL_APIKEY`

A "Full Access key" for the [ElephantSQL](https://www.elephantsql.com/) account.

Retrieved [here](https://customer.elephantsql.com/apikeys).

## Bootstrapping or Disaster Recovery

In the case of a disaster, to restore the system to a working condition,
 follow these steps:

1. Rename the following files:
    - `bootstrap.tf.ignored` to `bootstrap.tf`
    - `backend.tf` to `backend.tf.ignored`
1. Run the module locally:

    ```bash
    tofu init -reconfigure
    tofu plan
    tofu apply
    ```

1. Undo step 1 (rename the files)
1. Migrate the state to the new backend with:

    ```bash
    tofu init -migrate-state -force-copy
    tofu plan
    ```

1. The result of the plan should:
    - not recreate the postgres database
    - only perform changes related to the `elephantsql_api_key` module.
     This is due to the nature of the `env` module.

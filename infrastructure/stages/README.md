# Stages

Stages are logical separation between systems based on the order they need to be provisioned in.

As a rule, dependencies can never go from a lower stage to a higher one. Dependencies can exist between elements in the same stage.

## Usage

To execute all stages, run the following command and follow instructions: `./run.sh`

### Common mistakes:

When running `tofu` commands or the script, if you see a message similar to this 

```bash
Initializing the backend...
╷
│ Error: dial tcp [::1]:5432: connect: connection refused
│ 
│ 
╵
```

It means you have not initialized the correct environment variables for the postgres backend to succesfully connect.

To fix this, set the following variables, with the correct value for the module you are executing:

- `PG_CONN_STR`
- `PG_SCHEMA_NAME`

## Stacks

### 0: State

This is the only stack that is provisioned with local state.

It initializes a postgres database with [ElephantSQL](https://www.elephantsql.com/) meant to be used by the other stages as the backend.

### 1: Github

This stage provision the github organization and sets it up to be used elsewhere.

### 2: Domain

This stage provisions the [Gandi](https://www.gandi.net/) domain name and DNS records.

It referers to the repositories from stage one that require "pages" in order to creat the appropriate verification records.

### 3: Email

This stage provisions the [ImprovMX](https://improvmx.com/) email aliases.
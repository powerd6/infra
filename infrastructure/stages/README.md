# Stages

Stages are logical separation between systems based on the order they need to be provisioned in.

As a rule, dependencies can never go from a lower stage to a higher one. Dependencies can exist between elements in the same stage.

## Usage

To execute all stages, run the following command and follow instructions: `./run.sh`

## Stacks

### 0: State

This is the only stack that is provisioned with local state.

It initializes a postgres database with [ElephantSQL](https://www.elephantsql.com/) meant to be used by the other stages as the backend.

### 1: Github

This stage provision the github organization and sets it up to be used elsewhere.
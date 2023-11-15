# Stages

Stages are logical separation between systems based on the order they need to be provisioned in.

As a rule, dependencies can never go from a lower stage to a higher one. Dependencies can exist between elements in the same stage.

## Usage

To execute all stages, run the following command:

<!-- TODO: write command to execute all stages -->
```bash
read -s PGUSER
export PGUSER
read -s PGPASSWORD
export PGPASSWORD
tofu init
```
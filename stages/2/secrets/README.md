# secrets

This setups the shared secrets inside the GitHub organization.

## Inputs

You must provide the following environment variables:

### `GITHUB_TOKEN`

A GitHub Personal Access Token (PAT) with the following permissions:

- Repository access: All repositories
- Repository permissions
- Organization permissions
  - Secrets: Read and write

Created once manually, on [this page](https://github.com/settings/tokens?type=beta).
From this moment forward, available as a GitHub Organization secret.


### `TF_VAR_pg_conn_str`

The connection string to the provisioned PSQL database from stage 0. Fetched
 locally once, then saved to GitHub Organization secrets for future use.

Fetched once from stage 0, with the following command: `tofu output -raw psql_url`.
From this moment forward, available as a GitHub Organization secret.

### `TF_VAR_gh_org_admin`

A GitHub Personal Access Token (PAT) with the following permissions:

- Repository access: All repositories
- Repository permissions
  - Administration: Read and write
  - Commit statuses: Read and write
  - Contents: Read and write
  - Issues: Read and write
  - Metadata: Read-only
- Organization permissions
  - Administration: Read and write
  - Members: Read and write
  - Secrets: Read and write

Created once manually, on [this page](https://github.com/settings/tokens?type=beta).
From this moment forward, available as a GitHub Organization secret.

### `TF_VAR_gandi_key`

The API key from [gandi.net](https://gandi.net).

Fetched once from the page `https://account.gandi.net/en/users/<username>/security`.
 Note that it must be an API Key, and not a PAT.
 From this moment forward, available as a GitHub Organization secret.

### `TF_VAR_improvmx_api_token`

The API token from [improvMX](https://improvmx.com/).

Fetched once from [this page](https://app.improvmx.com/api). From this moment
 forward, available as a GitHub Organization secret.
